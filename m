Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BE9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KI2MeiZ/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AlhFf8zC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RZV2Bz1rnR1nwBwCIHteBeBwrgGrqm/NvJnIi7wGD7A=; b=KI2MeiZ/Ki5s0uOHDPioCYpMXK
	sK1Z/SBsPLNTm8B9ILhCf6401dcPOw9eK3jCH8mEx2ZeDl2f9p5Ah6ivb3JKX8h6MoOoI//ZQNGPi
	gEHHsfSjav1YJKRJqJDgULXwuk10+SZz4oGjIsTeTNxoYPMgVuvzpdm4oxwlNUwliNVBCHEwkZ9+j
	4PpeaiC84v/9Wb/TIwIuU1FHX8YiG2FjcNhROR7pokwwBJlV0c2bdxCLFwUyhOMbyM5orrlCENjQP
	tx/uZJAKtLwiQ+iYKbQKa0lE1CX8s7dRfOxtEZiB6dlfPg6998WLrU1XMfSFSZXzUNOysdDbkctNR
	6tqyxyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0vR-0000000HSqE-0prU;
	Fri, 27 Nov 2026 18:44:01 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0uH-0000000HSOT-39Qe;
	Fri, 27 Nov 2026 18:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795804954; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WcZtN3tD/zjvkk8uI44gdbTyPfvaOlx2Uyw+n6EalGUJfhu2vyRP3ATf6Fs40uUjjalYJ977Uv0z2PRkZEQd4IE76JryonkGpgoiw1qvX9Tjg50seYZmaLv9K8mvWj/gPVkYdhK0u8bXblt9FClGbhL12aU4fpfWVvHFl6VtlEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795804954; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RZV2Bz1rnR1nwBwCIHteBeBwrgGrqm/NvJnIi7wGD7A=; 
	b=msZ1BEW68rpZfIn05UPZaNVYPC8P2EHyim38o+oe5zt9X9dp44yOvAx9CnvPK5qD/D1GBqYnuT/2sBQJt4EHNFrJqJF3szqKvjcqHtF+1tXkCDkPW/S46i+J8E8M7FLiXTWXTUVGU/U0NSV+81pRf4Z5ehYkZFrVipV5e7U4UzA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: a=rsa-sha256; b=AlhFf8zCtIALPrXe8zga3TTnuSQt0lRzQGYtAzDrHn++w3fCVG+LhzmCx3usebRtnZHI1BJiwQhUVIvcEw6uiMt6Y9Crx6rnJoiYG0SEBR0fRflpO+xdg7OInUwN4YW4I9QP9CdbTZaNb+O6aUic1mFDxOzvtuMlUIk52JxFIY4=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=RZV2Bz1rnR1nwBwCIHteBeBwrgGrqm/NvJnIi7wGD7A=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795804951277426.7074106650923;
	Fri, 27 Nov 2026 10:42:31 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Sven =?UTF-8?B?UMO8c2NoZWw=?= <s.pueschel@pengutronix.de>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] media: rkvdec: Remove unused need_reset
Date: Fri, 27 Nov 2026 13:42:29 -0500
Message-ID: <sHCcy4ZARIqHsoGbYpMAqg@collabora.com>
In-Reply-To: <c0da8a7d22c6b837c2c8d62e6d267b54d6ed28f4.camel@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
 <20260810-rkvdec-multicore-v2-2-986f89d22cdc@collabora.com>
 <c0da8a7d22c6b837c2c8d62e6d267b54d6ed28f4.camel@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_104249_859132_E44EC4F1 
X-CRM114-Status: GOOD (  11.05  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi !

On Thursday, 19 November 2026 12:35:43 EST Nicolas Dufresne wrote:
> Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9cr=
it :
> > A left-over from the iommu restore mecanism was forgotten.
> > As need_reset is never set to true, the if has no use.
> >=20
> > The actual restore function is called above it vase the IRQ isn't in a
>=20
> Tell me what you wanted to say instead if "it vase the IRQ", or define the
> verb "to vase"?

It's not a verb, it is very ancient belgian English meaning "in case".

> > success status.
> >=20
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>=20
> Reviewed-by: Nicolas Duresne <nicolas.dufresne@collabora.com>

Detlev.



