Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26F2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKh39B6e;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xf4EfoLE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OShwcgume0qsMyIroIng9kRw/hq2uAXrc3M/m6vyoT4=; b=IKh39B6enHwds4xTvoMHBzhO5j
	twZkYUuwYY9nKZhllInYouqts98o5Q155cgyRoq1MUf5kaCy3Ow+4FBPuwszrDQUt/4sbp7aRNxVZ
	rc0x79k9PHysZgCMtHJZMax/dupt2fuU2a4VCq6PZv6UF7qHpItmOWeQjr9sDwa++Z3H10VqcC4ps
	W7D+PVu+6CNQlh11ZEPvYsMqj9+rt4csqr45amph+rXRJDB+omsq6GcDHeaGttg5trmY2fgcnSZIu
	Tbpdk1Wt5u+tyWn+9dR7wjWXlK29czekdEudtHSGUj6gPOscFPN/z/LKiuQQgHYvwa1306HcqTqT7
	DKDqDsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyZy-000000032Yq-2IMu;
	Mon, 16 Nov 2026 15:25:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyZr-000000032Us-3MBv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:25:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97475402F3;
	Mon, 16 Nov 2026 15:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCFA1F000C7;
	Mon, 16 Nov 2026 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842701;
	bh=OShwcgume0qsMyIroIng9kRw/hq2uAXrc3M/m6vyoT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xf4EfoLEajFX2rYfuGfjGhxn0V16UuC0Gkc26HEpPAmEcT4XxwDIYJaGDq6O3mUKS
	 JaFf2Qyd4qSfjRiUggJas4f0AJImSx70CU6tyrNajNRoo4in4AlnZ9OA/Qwgfkux06
	 H0FQsgCWyRe1hgfVsUT85i7xBe+UFKATOMfr49X6DCNx3Wox9Yy1y16YTqFdTz3jXJ
	 lTnYEHZTDhZ1oip22q6uyoqm+MOwZZMH1zE007qRK2bH9++oa2JMahEJ5ERw/x0pml
	 LMIe+x96RDu0ThNG6IuxGT19ZhHr9VULtu8PK43AX5Hi6McOoluC+BBv29el1rySf2
	 1a6++Ygt2kieA==
Date: Mon, 16 Nov 2026 15:24:57 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com
Subject: Re: [PATCH 3/3] powercap: arm_scmi: Refactor scmi_zones_register
 error path
Message-ID: <20261116-imperial-mighty-platypus-edbffe@sudeepholla>
References: <20261115110546.2344308-1-cristian.marussi@arm.com>
 <20261115110546.2344308-4-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115110546.2344308-4-cristian.marussi@arm.com>
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
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 11:05:46AM +0000, Cristian Marussi wrote:
> Refactor and simplify scmi_zones_register error path by using
> cleanup handlers.
> 
> No functional change.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

Hi Rafael,

Can you pick up 1/3 and 2/3 as fix for v7.4 and this refactoring for v7.5 ?

IIUC, the refactoring is done at last to keep fixes simple for backport.

-- 
Regards,
Sudeep

