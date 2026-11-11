Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gNho1Cwj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fo3Hj1SD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7mgWr1pZb7yNWIt4OPiuVc2e09ECAvShm7sgjMRNlNQ=; b=gNho1CwjmRD5D7IEHUMAqjUmWM
	MulA/trW8zLu4RyHkgmZJtBxGM11J7wp0dEVwtkjo7QniGoc3pukek5iMcTmiqV09If9xZ1eqyM6c
	x8yUj7B4eyjO2XueD6HxBfnTjLXFFjeB3cbQd5i1xInUWxmgsL31j5FP8mfIX4FZyt9DGsBdKXUfG
	vyowZkD7GV6EJu4Su+gKQF9fLR/eDsCHxHxb0sj/uYgnBxaHO5zdtkzkF2l+KuGHjUFmQGl3KcQZC
	QzYez/OJKJWorIc4V1WWvc/aJhmrkIglaeqsTrQWbQ/HYGDqQ4el2sKqBFMcWdQ9BlNx/8rSrlI1G
	Yi+B4opw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7wD-00000006kim-1O8m;
	Wed, 11 Nov 2026 13:00:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7w9-00000006khd-3a32;
	Wed, 11 Nov 2026 13:00:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6416E458D9;
	Wed, 11 Nov 2026 13:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9DF1F00A05;
	Wed, 11 Nov 2026 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402025;
	bh=7mgWr1pZb7yNWIt4OPiuVc2e09ECAvShm7sgjMRNlNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fo3Hj1SDwn8RxIMwTVvbptNy74Dg9lfDShmeUDHRK0LWAKBI2JcdNsKcsfM2LBoqm
	 VJh1Z3JR89/h1hzLWgtwWb1n53WOD9pFD2QenXg9lh+xAmwDA/Sj1SCV25W9gXLJdo
	 H9iaIsuEwP1pzEpJKwggSUat4m9tiiXDGad6u6M6viXklRc2PllfoGwk53NnX5F8YW
	 FNIV9xSdC7eamI8fVGkuG2Puw4mfgk6ZiVLWeDNTaZughW+kM882xvCVeRiE2sDS2P
	 upODuQhTU5gmaoxSUFXNYRN0OEsREreowqmDcfsTmFwf3B/akJA4qw2rU5fMnE0oqF
	 XUAzPuZboR7OQ==
Date: Wed, 11 Nov 2026 14:00:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rui Cao <i@udp0.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: mediatek: Add MT6833 and the
 Xiaomi Redmi Note 13 5G
Message-ID: <20261111-manipulative-fulmar-of-lightning-34bee8@quoll>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com>
 <20261107-mt6833-base-v1-1-bda21083e9f3@udp0.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107-mt6833-base-v1-1-bda21083e9f3@udp0.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 08:21:58PM +0800, Rui Cao wrote:
> Add MediaTek's MT6833 (Dimensity 700) and the Xiaomi Redmi Note 13 5G,
> codenamed gold, which is built on it.
> 
> Signed-off-by: Rui Cao <i@udp0.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


