Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41B1606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gx6k4mZr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvptYu46
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yZTnZuexd9uLwgL3t6Hp0pHWRLfugF4lPNO7U7GDfmE=; b=gx6k4mZresIVKz
	L8UmxqZ8dBl/ST/B6KQ6f+pBtqAhbpgvtPDIvHhv1GpkFp/UbKulm+OMn0ePP6EVUbHgRPFpokZ9b
	4ePsXFTlbR0K0fu7t6Q+NrqluoDr7eEU0Wrv5NVwUTxD1FuVJTAD5uzkcdvmBXQ89i96ZE1nDQsPh
	w9d3DI+INglIhmWAkfuFzEFn0kOCiJDc7P9KgU5F9T223bwTQTGKgPKeUNlnLjoDwxhn9UJCm98TS
	a6/CHdUH0ZPfi36uqQlcQZovgYwvaudJJ99flihF4yaFwve3VWT2x8cFypvb7/KNLMVGTDMfVu1Hd
	Ve1t/DNl5LRHOVE6401Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb8H-000000002Qc-1vRk;
	Sun, 15 Nov 2026 14:23:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb8F-000000002QR-3TF9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:22:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D959B60D67;
	Sun, 15 Nov 2026 14:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0301F000C4;
	Sun, 15 Nov 2026 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752578;
	bh=yZTnZuexd9uLwgL3t6Hp0pHWRLfugF4lPNO7U7GDfmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NvptYu463LBlxh0CD+GsSiVXHNRZeU5Z8VexQ1l/VpUFuKoHnLPyyq11bygCEVsBo
	 Vr7IbmtVBa8nOBy5yOvTg6tKRMSr6PIspxDDV1RldjC4gmQKcTr4c2kLZrXV9YCUnB
	 IqTh4U6/WTP1STLWE6lF1wunykWJGMTaLEdvS6v6yCOepjfI59+mfm6T3rUSEGT+6N
	 w173guqfnApUhK0z7okfy6SO6Fow48rQ576GFueP37GKZRLRrdsq0htX6TcYDykLcb
	 X3E7jxhskYPFsE/rbh0/ppm4ZG4WpJRj1NDZOPLDR2MB1tju8cMecWg3O+VzGcWshg
	 wXMZRFivxi8Yw==
Message-ID: <056d5a5c-f573-4269-9530-ebba0c575449@kernel.org>
Date: Sun, 15 Nov 2026 16:22:53 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/16] dt-bindings: clock: at91: Remove old PMC
 definitions
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 "Rob Herring (Arm)" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-17-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-17-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 13:06, Alexander Dahl wrote:
> Those were split up per SoC and are not used anymore.
> 
> Acked-by: Rob Herring (Arm)<robh@kernel.org>
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>

