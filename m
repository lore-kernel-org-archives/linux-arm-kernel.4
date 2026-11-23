Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B67606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LnYoK2yl;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XvrhYRAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U18C2QTlD6mJ2V8xCyohK38ZhFleFWE9EQ0CHhe9nr0=; b=LnYoK2yl5u983N
	SEBY+OvZPjuYin8mAnAr8YxEYP6hBCWWNw0EKUwshROGYSWrqMotHuZdp0E9Xvi/i0da+78cmQs2M
	X437oI+IpYPVl9FDqCzXNyzy+0E46FI5i8xkQKczPGZgtHKCfGy+/QCkP/5RyCYStAEzbfXWBLtVL
	FbZIvzRVC5mICwcTnreQQceWy0vaA64Hzo2zDQMWMOkx3zg1S67cFdmpjoZ0n9eeCFtNedh2D7vyy
	mNpiQ5JY3rZGFjERALkYgeGrWwcLcCw3BxM4V1ZW7IHSaFQqlEaVFLBPWMIj56njhGLOxw1jy8vtD
	yyC0UH69rkAl4/KcLK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKV5-00000002BZR-36Pr;
	Mon, 23 Nov 2026 03:13:52 +0000
Received: from out-136.mta1.migadu.com ([2001:41d0:203:375::88] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKV1-00000002BYW-1eVt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 03:13:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DC+Hvmg4wtHuuxLSzB6tnYTd241eZJs+uGq5EvrA63A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795403625; v=1; x=1796008425;
 b=XvrhYRAEn1py/XepGUc6Cj5P0xtD4dPnh1JRrauOGsOXq40oOojQzMG0a/LIKTNzdp2TcCxE
 MVN9+8ieyBXXNwwSwaiXz6nRF8kWGjYvbaweZ2rIEn5+Kr9l5ECqy62cRtnp6WZtIlMLB4qz11A
 59xeU5LeXhUWxPKgUdvlMJgQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8cfdf9be3d9a39e9;
	Mon, 23 Nov 2026 03:13:45 +0000
X-Mizu-Trace-ID: 8cfdf9be3d9a39e9
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 07/19] hugetlb_vmemmap: Allow architectures to make HVO
 enablement boot-time only
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-8-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:13:27 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: 7bit
Message-Id: <FF5ED811-50D1-4B90-A72C-4606E51C9FD5@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-8-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_191347_583803_89F83B8D 
X-CRM114-Status: GOOD (  13.22  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote:
> 
> Architectures may need to configure the system at boot depending on
> whether HVO is enabled. For example, arm64 needs all CPUs to support
> hardware updates of the access flag to safely update the vmemmap in
> place, and may want to refuse to online CPUs that lack it, but only if
> HVO may be used.
> 
> Such configuration is only valid if HVO cannot be enabled later at
> runtime through the vm.hugetlb_optimize_vmemmap sysctl.
> 
> Add CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO for architectures
> to select. When selected, the vm.hugetlb_optimize_vmemmap sysctl is
> read-only, so HVO can only be enabled or disabled with the
> hugetlb_free_vmemmap= kernel command line parameter.
> 
> Signed-off-by: James Houghton <jthoughton@google.com>

Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

Thanks.


