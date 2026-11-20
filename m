Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2114606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5AIzWmCC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AOgRSLhJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WhaebfWiS1VXN82KLOZz1WCfzqv1TpGJKn70SfWk5W0=; b=5AIzWmCCzIVabr
	5mq1eDrTZ8I3tC3c/QH3pxXjhgiSt6eGS9bn1qBU9wkjhk5Lp1Cz8xrbYxe2oM55Ikt3h36h3DAOq
	vPKHu/S1VxpZfnxq0S3vBsd3d1encCcR7MF4WxrFIn1gksQgy4tUIQoW2x1KpomStR4TO37cQOEVg
	Dnd7CJRVhEXpNWAzO3tl3sK7YgGMF3zCl3onN4RPVIz2LlEADts7qubGko57pmEzpsBcyJmW7LLl+
	3LvQe6PV0qkgw3ZdmSYTkngs7WMGE1vprayXqq2wX2NwvzqgItvWQelhESY+MgLI8kM0N9DmV5shW
	X19gS/DXPInc2tl4OIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQXE-0000000FQQc-14sv;
	Fri, 20 Nov 2026 15:28:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQXA-0000000FQOu-2OOP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:28:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ACCA3613EF;
	Fri, 20 Nov 2026 15:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC141F000D2;
	Fri, 20 Nov 2026 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188495;
	bh=WhaebfWiS1VXN82KLOZz1WCfzqv1TpGJKn70SfWk5W0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=AOgRSLhJCbYeK6jNnplfLl2Kq5M6XrwmKNN8elkW6waXsIj4Ns+APjITnuDSHz1f6
	 MneXC1ecOi0p8jjYAEUytXuGhLCXhhWYXIszLzRJbz9XoJquQN4WCXFB2qq0ukwS7r
	 ONMUGW5gL7ytJVNJi1U7ss+sUo5Psq1cU1QZaJ1bY0bxv4GmNHEm53kUgECFSSgryy
	 U8UGB/BqCgsHVJ4m/G34c98P6/WNUkwJoNSSFNmYpT+i/08ymOQJRWKc2uwhyau5Nz
	 WOHIbv/5DDV556chd+EKs03BijdnbtRnyej7Lg1F3mVxWzmrntalhSPSq5/D9XlPGm
	 JufJ+bFjoMTKA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash
 controller binding
From: Mark Brown <broonie@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
 stefandoesinger@gmail.com, krzk@kernel.org, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014072109.1759502-20-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-20-ghahramani.navid@gmail.com>
Date: Fri, 20 Nov 2026 15:28:09 +0000
Message-Id: <179518848943.6016.16140133614242447239.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=639; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IYVVL1WQpODtUTYbvZYUESLycirYOu+mnnmWexmbyOA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZ0rlY9Wcybbq5QPAnY8wKptu/A6w+HGxp3W+b75qjy
 r7uXvOOjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExkWjnDP91f0bu//Y8I2iPl
 F1cb9PuZ2t0Jp/zrX13co9q9k5khKIzhf5B6jljiedXMq76cz6f7/Jjs2sZ5OEjxirVwQOn0aP+
 7jAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add Device Tree binding for the ZTE ZX family SPI flash controller,
> supporting both ZX29 and ZX279128S SoCs.


Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

> +properties:
> +  compatible:
> +    enum:
> +      - zte,zx29-qspi

This looks like a wildcard binding which we don't normally allow.

-- 
Mark Brown <broonie@kernel.org>

