Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831F9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jG+npwVR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpQVBU6N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dJWrFakGMncVSTy/NQFStPBZpGIW9Ki1okE14NbXwPs=; b=jG+npwVROr6Y3H4bKtQY/1XSkS
	983/VnIgy1CMskpVxBoHe4bjvohiXofqfnsxh7/8hcrlILIHQcjLDQ+MlhE3PsQtEAjFzTvOaF0Sg
	09YRpkc8OaOUdXFO3tu0vGp7Ko+kjFzuEgIyxrSULGCyvbC7I/8dOn1c6TytWGuvLRGZEhvefDOUE
	p7563idvEKKyRX0IthTWpNZA6OM1frK1cthecMd+IzrEELP/7iQcv9r05vnF3e4WvM4tGEXDMFVQi
	DtT/zq+XtwxdebRj5+oT8KAwmIRz/ZMqB5htVzG2SEXxS1nLiBPMUftGHQb/sRkSkRYZRxVcTZdlf
	4DLF1zYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7AV-00000006dEp-2POC;
	Wed, 11 Nov 2026 12:11:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7AU-00000006dEU-2PbS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:11:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EA6A44869;
	Wed, 11 Nov 2026 12:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC481F00A05;
	Wed, 11 Nov 2026 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399069;
	bh=dJWrFakGMncVSTy/NQFStPBZpGIW9Ki1okE14NbXwPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cpQVBU6NMCFOTQdQqKnS4QOAbb9h6o+v8KQTiQ1P1rDmux9bWmCLLwmYmiWIdiJGZ
	 TrKIwzDRg0KzxZxu0wBXzwStKE2tatm97dy9GcbJQ9+EVn7mvWquyAJ2y21OTT183Y
	 mkFZxnbTqrdFCvSrEB5P8dd/d5cC9uquFJ2of9OLHw8czpnyKPoGVCv4DqVO82fNkk
	 WiHuu3YSRArQ95SRRMyoKSgez2V6nDBI2DOWUYQFcaUjmLHeLLkqY5cxmrhfweclla
	 jKfQMHRi3qh842sZt9huYLDzpS3H+ZXnya16llu51WvK4WB0e3IsMe/ZFhV36oltoH
	 9SeoazGv1cdzA==
Date: Wed, 11 Nov 2026 12:11:06 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH RESEND 1/2] pmdomain: arm_scmi: Skip domains that fail
 initialization
Message-ID: <20261111-busy-silent-whale-950f5d@sudeepholla>
References: <20261109155332.1686594-1-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109155332.1686594-1-sudeep.holla@kernel.org>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 03:53:31PM +0000, Sudeep Holla wrote:
> pm_genpd_init() can fail while allocating generic power-domain state.
> The SCMI driver ignores that error and stores the partially initialized
> domain in the onecell array. Provider registration then fails because that
> domain was never added to the global genpd list.
> 
> Preserve support for partially available SCMI power domains. Log the
> failure and leave the corresponding onecell entry NULL so the other
> initialized domains remain available. Explicitly skip empty slots when
> unwinding provider registration failures.
> 
> Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> Resending
> https://lore.kernel.org/all/20260923101608.4180057-1-sudeep.holla@kernel.org/
> 

Hi Ulf,

Gentle ping, not sure if it is landing somewhere else in you mailbox,
just putting your address in To: now and trying.

-- 
Regards,
Sudeep

