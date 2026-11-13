Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79252606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BfRmn7Fe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMjRFSFx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NtbrLJPcPp2H5QaCnDkh2crwBlw+qLqEnBmAmeqQoz8=; b=BfRmn7Fe7K0d4oExn5r55usw2q
	lD0qr2YoZv+7aWyyrEedYjSbBT5YTp/8/S+AwwUr/j2saH9mZijZXye8kbB6xbRYEi50bPLsv2o6U
	pYgFRFDkVov7Ywxi1/AHogs0E85AMN1lVrBY06oEoFa4vcPca7ICMnYBjmsS1GWxziiHeBEDRwMtc
	/PAwPd8wSyiajfs0xmM2GunfTuWBLkI873KuxIIPtz0Otn6UtrPIOYmXSEBA1yumj6kpcyWhBKhqv
	wlhAMT0vh6YkKGmfWE1h+ykCfR5veiandeS/BK2zS3qePVnRYnOaIjxUsxSQaZ5T1TKp0w6RpPFh7
	BIEBPKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm9O-0000000BxX4-12IA;
	Fri, 13 Nov 2026 07:56:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm9M-0000000BxWo-3U4b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:56:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A8BA438D0;
	Fri, 13 Nov 2026 07:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290721F000C4;
	Fri, 13 Nov 2026 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556604;
	bh=NtbrLJPcPp2H5QaCnDkh2crwBlw+qLqEnBmAmeqQoz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VMjRFSFxrzUdI6yCYK5e7k/E8bL5z65KLjdaNGr2znOSpEgTiHk0DItaQEFyzCVhX
	 Y2rQxS1VQogYTo5/OA/j+UqAigXjqdKCWRMk+phDqzCxDhzCzTpuT5HgNFrZ62yWMu
	 RUWre0oMDVxazY9dvM15NmpzV4v0pr2+Q4rNa/1kJg71HcdjonTn+v6xEj3XzvPMJ+
	 34xEdXgxvb1RdKwUCvVNKECwtFjPcI3MOrmhn9BrdyQ3GorQ3MrfdiSlje/cUDgAbX
	 C9cTjKShbwk6zfPSmnEq5rNk+De1gx51++KPDRBEZVIHGz/diHnc2HjpbFMCGnz3BD
	 KJjlxoMh4OV1Q==
Date: Fri, 13 Nov 2026 08:56:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moteen Shah <m-shah@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, nm@ti.com, 
	ssantosh@kernel.org, u-kumar1@ti.com, gehariprasath@ti.com, vigneshr@ti.com, 
	afd@ti.com, a-limaye@ti.com, y-abhilashchandra@ti.com, johan@kernel.org, 
	kees@kernel.org, jm@ti.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf
Message-ID: <20261113-fancy-trogon-of-saturation-16fc66@quoll>
References: <20261112091027.1601122-1-m-shah@ti.com>
 <20261112091027.1601122-2-m-shah@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112091027.1601122-2-m-shah@ti.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 02:40:24PM +0530, Moteen Shah wrote:
> +  reg:
> +    maxItems: 1
> +
> +  ti,proxy-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      Proxy region (0-7) through which this node's clients access
> +      claimable registers and their fault status registers.

Partially continuing discussion from v2, IOW, device cannot access
entire address space and you need to limit the address space to specific
window of it? At least this is how it looks in driver code.

This looks like the MMIO space is wrong. Listen, if you claim that the
DTB represents the host (or VM) view on hardware and based on that you
add proxy-id property to restrict the MMIO, then why do you claim that
entire MMIO is correct for this host (or VM) in the first place?


Best regards,
Krzysztof


