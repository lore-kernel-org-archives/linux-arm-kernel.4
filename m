Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBFD606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 02:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KfTwpbby;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ahjX5fVH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GS4NVhiAOnRs5e7t5yEw596+HJfBXXj+oSDJGrq3dyA=; b=KfTwpbby9t+iwAj2pCehjkfmK8
	OghJCFGT7cBb3Y6bTjPMFWIQHd/lYFr89JtZpA4gwsxqmp7j5icMpbkxilYgpy1J741wT7cG9b5TY
	ebC+9iZjsc5DONAp0Fk1IXJLfYHba6WtkZuO71VEALX5/7B19Fb2k9oCiTHD8WSPAIeJC4NvHCfHo
	CMJAnR0UIrYsunTpUGx/9WPMDlnk6iSl8Gfkzb1hJE6l2pnEIiu8S8TnN49NqhpUX8xPYtAiuzwtj
	UGzoRiqZfQeX8u/EvdiMPjPiPxKJStkBbBLLUIQ0bqVnhecrTGz67KRKFMPmusdjJ+k2InC0IkelH
	Bljgsp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTs8n-0000000Ahy4-09Vb;
	Thu, 19 Nov 2026 02:44:49 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTs8h-0000000AhwX-2a9Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 02:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795056277; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=GS4NVhiAOnRs5e7t5yEw596+HJfBXXj+oSDJGrq3dyA=;
	b=ahjX5fVHxozE3ApUJ+MtkImKIUbVxk4h9dBywOuGQ3U37B317mn1R4Jeu3DlWu2rhd4ZOl3YduXgJSSG03W44JMy2v070X+lXqN0D/HhI65ERJgT9wUn6WZtekzVacv8rnYA99xkdRyhecPH/FnR0/jWK2AMNMwTVQ9gL7NtybI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R351e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=yuxiong.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XF27X32_1795056274;
Received: from U-Q2G32XWJ-0138.local(mailfrom:yuxiong.wang@linux.alibaba.com fp:SMTPD_---0XF27X32_1795056274 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Nov 2026 10:44:36 +0800
Date: Thu, 19 Nov 2026 10:44:34 +0800
From: Yuxiong Wang <yuxiong.wang@linux.alibaba.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Will Deacon <will@kernel.org>,
	Jia He <justin.he@arm.com>, Mike Rapoport <rppt@linux.ibm.com>,
	linuxarm@huawei.com, catalin.marinas@arm.com,
	Anshuman.Khandual@arm.com,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	James Morse <james.morse@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>
Subject: Re: [RFC PATCH 4/8] arch_numa: Avoid onlining empty NUMA nodes
Message-ID: <av5ikhyVRSgTmIjx@U-Q2G32XWJ-0138.local>
References: <20240529171236.32002-1-Jonathan.Cameron@huawei.com>
 <20240529171236.32002-5-Jonathan.Cameron@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529171236.32002-5-Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_184444_334308_9D4A0416 
X-CRM114-Status: GOOD (  13.43  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 Wed, May 29, 2024 at 06:12:32PM +0100，Jonathan Cameron 写道：
> ACPI can declare NUMA nodes for memory that will be along later.
> CXL Fixed Memory Windows may also be assigned NUMA nodes that
> are initially empty.  Currently the generic arch_numa handling will
> online these empty nodes. This is both inconsistent with x86 and
> with itself as if we add memory and remove it again the node goes
> away.

Hi Jonathan, Yuquan,
 
I also ran into this issue on arm64 and reproduced it on current
mainline: an empty CFMWS node is onlined at boot as memoryless, and
goes away after the memory is hot-removed.
 
I noticed this patch fixes exactly this problem, but it seems it was
never pushed further: the rest of the series landed in evolved form,
yet I found no respin of this one on lore.
 
So I have two questions:
1. Was this patch dropped for a reason I'm missing, or did it just
   fall through the cracks during the numa_memblks rework?
2. If it was simply overlooked, do you have any plan or interest in
   pushing it forward yourself? If not, I'd be happy to carry it
   forward with the original authorship preserved.
 
Thanks,
Yuxiong


