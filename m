Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2CB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lvpJOauj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzFxeMox
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DJZPcRbincN2Flmn0XzWIYGVCGZ+6GUHIJvSkNagofM=; b=lvpJOaujRDi72mwWSZe+gDcYE7
	G+Ep/CMwi6xAYi/Y4fWSz3zgbwrHclKLCazprX1LoW9PznOhpPYpzkq6R5xx/myvpftj0s+IlLKF1
	SSrJLjNQjmL15Oj49UGfurZIus23cwTHP6aWXP6Gqo0Qzz/PydVRESqbx8T2p+voSj3TzkzHZ3sWL
	Aowj62oJzoFMM5DHMdjxyUp4j4t3FARhVOxWdrORhJP9Wly0IWH3U3vV2jqOKsEOwaS2jVVTrKxpE
	xzHKoSvj6iK6k8xBE/f3ZHhC8LIzJDMCvjfQOUcEV9i6sXJ2/rWCO1+y6Z352iu/ijqs20W3eECQV
	Knh8kSsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPEw-00000000mRH-2a8A;
	Mon, 09 Nov 2026 13:16:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPEv-00000000mR6-24md
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 851AB602C2;
	Mon,  9 Nov 2026 13:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422911F0089F;
	Mon,  9 Nov 2026 13:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230208;
	bh=DJZPcRbincN2Flmn0XzWIYGVCGZ+6GUHIJvSkNagofM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QzFxeMox9FdkZ2u7XwmZNmFg/6SH/4OkYDiOeM/es4Zkigp73LJCh9RFxWqhkbBwd
	 bOhikqceoK5Teh87RaeaA2h9iKGEUyOIRL4HEtXcUN9yfCIMYn9QlSRdNKMwQQcNMj
	 vtjH9LanRUvxBgWMEKhhmUHnOzo+37FEZF0LDvjN9edS8vTjKnkk8mLNFKpzY9gFKo
	 75rMKNCiMK9plFuUXXycbajy4nHzqPBArHWrb+6CPqqaaOj9bCW+ja3C3r1+v9GwNZ
	 wl1ITNQZGJy8Q509MrXDq0ddk8RCvElmhA7NP69HGoNIloXGOThV+snSyuO4pqgkLd
	 nAvhA9b5Irv7A==
Date: Mon, 9 Nov 2026 14:16:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shan-Chun Hung <shanchun1218@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org, 
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kees@kernel.org, gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
Message-ID: <20261109-petite-imposing-ermine-fbbbcd@quoll>
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-2-shanchun1218@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109052900.2960473-2-shanchun1218@gmail.com>
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

On Mon, Nov 09, 2026 at 01:28:59PM +0800, Shan-Chun Hung wrote:
> Add binding for Nuvoton MA35D1 PDMA controller.
> 
> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
> ---
>  .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


