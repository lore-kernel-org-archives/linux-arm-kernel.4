Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E893E606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XkI10oF2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bxTk8UKi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=56wtRs1M69TfCxyKRriFEbro7oso/WPBNs4QdzumLlU=; b=XkI10oF2XfrzRvwK2wDCbOT0pP
	6K5GBSWr7nLYqhxCDtlebKQ23vq3eUikt8tU4oR50r4r72DkjdeSbLZhCW+9+5r/gP8UA0u4gbVSk
	cKTm+0FqMCzKXWbR82DpZ97NC4C0uU1qXBTL+m+2v5Bdn+YjMrNm9LTdpgZaBXh1gbmtURSgOxccl
	zx65lEka0GGlsJ7kY9F4HQKZFg41V7y4SSeDIowssgcXVobnBitLkxVd/YL7e1BuQ0LefLVZbfGu/
	MRudbhkEMaTYggtDQaPMWWSwXtzpb1mcaAmNcmtTCT5K/ratJy+H2KaVwgdgInbtWZiHwCK2XYvtG
	F5Hww3Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxW4-0000000Gh8l-42xg;
	Fri, 27 Nov 2026 15:05:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxW0-0000000Gh7S-00Bh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:05:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1131A169E;
	Fri, 27 Nov 2026 07:05:28 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07FD33F632;
	Fri, 27 Nov 2026 07:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795791930; bh=6+qcC6DMiA9X/fESkEBuCB99oeGyTOfZOAFheP/qEaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxTk8UKigkW2i6QP64PKfkBE6TTSh0PM5R8aILg4zrs2oBmGXKQbaHMsfFX73CJ9X
	 +4DFK3cwskxa7I1xlhvClaogtdgO2EjDI+b27iwEyXINlLAt41XeXjn12CV6lA7mwL
	 Mw7UdFo8lKsZTZZYD7ptGl+3kJMSqdFBV6HlVVxY=
Date: Fri, 27 Nov 2026 15:05:25 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC PATCH v7 11/28] KVM: arm64: Add a new VCPU device control
 group for SPE
Message-ID: <awmcNYh43YWkB7IW@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-12-alexandru.elisei@arm.com>
 <atI1NfqxWsPOhvBX@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atI1NfqxWsPOhvBX@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_070535_024181_F928FEDB 
X-CRM114-Status: GOOD (  15.02  )
X-Spam-Score: -4.4 (----)
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

Hi Lorenzo,

On Fri, Oct 16, 2026 at 03:44:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 03, 2026 at 05:06:06PM +0100, Alexandru Elisei wrote:
> > From: Sudeep Holla <sudeep.holla@arm.com>
> >
> > Add a new VCPU device control group to control various aspects of KVM's SPE
> > emulation. Functionality will be added in later patches.
> 
> Again fairly thin commit message, be useful to provide more details.
> 
> I'd also explicitly say you're adding stubs and the foundations for this but the
> actual implementation isn't in place yet.

Okay.

> 
> >
> > [ Alexandru E: Major rework ]
> 
> Generally [] stuff is for small fixups done to a patch, so a major rework isn't
> really suited to this form.
> 
> The done thing for this kind of thing I think is something like:
> 
> Co-developed-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> Note that you require Sudeep's explicit permission to do this though! :)

Asked Sudeep, he agreed with the Co-developed-by tag. Will update in the next
iteration.

> 
> >
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> Overall this looks obviously correct (TM), so with the commit message +
> authorship stuff addressed:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

Alex

