Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C78606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 04:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mm73P1wh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4XV7rKRI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NwKyPi+EXp0S/WOyO+1mrzsEeZFSZSXM/L2QcxcxUKw=; b=mm73P1whbz9vdR14ERhi7aDn0P
	R3medTf6Wjg2X8tSpojUHUv04VjYb3rClR2wx8jpsmUItigw3bnJ4HvNlTjQbJsqa7R5tRlg9WRfT
	vu9MR0cs7Du3iqoWhbzh5yt5ascuuxzKb6zeEe8p9ARu8VDW2/cvNjybXJjp/pefJrESmY8Ne2QxB
	9MVbjE2D0a1DTljX344NWrGVOJPacoMFJOMbd091UgijGiRiedjKI1uerwlUPKeqXbGw+5jm5j0d5
	i97e9sGhBObD0k+b5uCJe8iFcOo5/WCJKh4ZrJS583E1DO7AuvkIejnXNbOQPwsRWPhcSok9C9Q75
	FQ274X9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGFq-0000000E1cv-3qOa;
	Fri, 20 Nov 2026 04:29:42 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGFo-0000000E1c4-1bGK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 04:29:41 +0000
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id UCkSxFjsBAR1iUGFoxBOlj; Fri, 20 Nov 2026 04:29:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UGFmxOL5hFhzrUGFnxrcXm; Fri, 20 Nov 2026 04:29:39 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6affccb3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=zpOVymEVAAAA:8
 a=sfOm8-O8AAAA:8 a=RSmfSHFI2LoBTrHSb6wA:9 a=CjuIK1q_8ugA:10
 a=LCD48ZUe64JR9pieE8wa:22 a=TvTJqdcANYtsRzA46cdi:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NwKyPi+EXp0S/WOyO+1mrzsEeZFSZSXM/L2QcxcxUKw=; b=4XV7rKRIxdtmrGqva0T2IrI2fZ
	RbG62Z+GkHytSWmn3OK7x5TcoHPqi2jjO++MwW+nrzqIj6wGDIXNuU3DKMGjBJ7A15TJXXJtGffXP
	Wpx5BPtFNj4E/jP4wP3PWOv6ucUEyGYvFB3j5Jmm2PB3Jly+/q8dNtWn+qJqwr8pCj7/douzEkBD7
	5KOjlIXhDObzVwKzdztx8aRyoW2m85f0vxQTvBWdGYvoMXD1URp5oj7zoPYC9wCLCKV5dVrnjkzNI
	X69gtLKLCLQx8MKJtNFYTnUmZ7zGBeMi9OaZekp2SCQwaen3jA8+tkz9sGZFgE8JMMgxZx/+U4MUq
	mes/Lmog==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42072 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUGFl-00000003dbL-2YK5;
	Fri, 20 Nov 2026 09:59:37 +0530
Date: Thu, 19 Nov 2026 20:29:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ben Grisdale <bengris32@protonmail.ch>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] watchdog: mediatek: add mt6797 support
Message-ID: <f0ea8f8d-eef7-4d13-8180-ea3e297c407c@roeck-us.net>
References: <20261110-6797-wdt-v1-0-7f07755b6074@protonmail.com>
 <20261110-6797-wdt-v1-2-7f07755b6074@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-6797-wdt-v1-2-7f07755b6074@protonmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUGFl-00000003dbL-2YK5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42072
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 17
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC4Wx7jseOoAYbGAOQemIhx3pjGBb4B9iFnVQOSSrolvEnCFk23JIC5jngcvCIVz/qV9JQIr58rmFvZ0E8vPV0xn0XBelwgImVJO5FN8lCc+DK3cqpMw
 iZdN+WwloBnNKSU+iGlxI/7Btjwa31TtJPKrFS1xle1Z9nKPbO7TIp8LU0dsYKlcUAzmXBho8xRWbpZpXS2dRgVmKuWh+67oMkUFWfT7jQL3h4ePhq3mVC0c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_202940_443183_EDC16E7F 
X-CRM114-Status: UNSURE (   5.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.6 (++)
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 09:22:22PM +0200, Roman Vivchar wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add support for mt6797 SoC watchdog, which provides 17 software resets.
> The mapping table uses bits from the datasheet [1].
> 
> Link: https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/docs/MT6797_Register_Table_Part_1.pdf [1]
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied.

Thanks,
Guenter

