Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C72606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iYKnRU5D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LQef3x9T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g/WOkBC9oooEcGEsmNj6CUsgiTKwZCs78ZjQCVM3bLg=; b=iYKnRU5DuPSPFLYNTbQFQMe6uP
	rE6JBUDu78l9VnwNmZrwJSBVPNQONlr8HJjbY6rAsu/NBHvhKBq36J2ze7nsOrqBhCePBF/PrQbXF
	o6PeHgotL9Bs4cRwhmttniMDwdzPiukuItlPyKYb1yqDeUhSdGY3f3o5ZQ9jN9ulqZujx5TreXTTq
	RVPvPoKgKb/LXgZiS3NIIbVMaPXn14XdIp8Z08qiUwiWVKUvj92tTXHeaSRBiImWRXQC8mz9LSwtu
	R8eir8xXzdTKJs8OePgOJVioXk7W8nF4eUck/MeZbyJhIEdipc31jGdRe0NpsBNG7OND8MIV3+K6j
	D21xaa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGvK-0000000GURL-3i2E;
	Sat, 14 Nov 2026 16:48:18 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGvH-0000000GUQy-3Mtk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 16:48:16 +0000
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id SDcgxKIjOVK9USGvHxmMie; Sat, 14 Nov 2026 16:48:15 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGvFxezcQ0288SGvGxads5; Sat, 14 Nov 2026 16:48:14 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af890ce
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=am1Lr7bG9l61o50XTrMA:9 a=CjuIK1q_8ugA:10 a=mshYcpSARKEtRsk-hzoo:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g/WOkBC9oooEcGEsmNj6CUsgiTKwZCs78ZjQCVM3bLg=; b=LQef3x9TKxEsj/azRFTjtluC2A
	s9zWVsXiEKhkKDKbC3ASHmTxXKKfbbaoJ+ZUcMOvr2ZqpgTb9nr4nvWGPhLh+BOeEoeqna1xX+FGw
	NgZJvmv3rYfMdsIS2IhQe5EWmw1N8jYpZhMT5Y8jYVwKk6ogZri5dPExhkiF8gSKk6tjRshQIpOoB
	qCw/jm8tRvGA+ry2m+378tKVRygHN0vy4bb2osa2DmDP1JSHRvXxezRyNhD/RB0GZBZ5Rd63wClKC
	J72oFY/vTYwoWGWLdzhk18tfR5Bm2+An1vX7YGbaSquAHIF18wdDjGrZQw05x/+BMdtEwb+9O3ZB1
	Pe7HoFLQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34036 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGvE-00000000MIg-2pOP;
	Sat, 14 Nov 2026 22:18:12 +0530
Date: Sat, 14 Nov 2026 08:48:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 3/4] hwmon: Add Microchip LAN969x fan controller driver
Message-ID: <118d242e-6511-4374-acde-80efbe7bbc34@roeck-us.net>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-3-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111161619.232141-3-robert.marko@sartura.hr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGvE-00000000MIg-2pOP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34036
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 116
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKpzSzPKbm1f2MduA/6pxPS/EYpDHzKkeHTYGGeNqfPwS38NLfIF2gNcE/6Yuwz7g8natG+w0zqqLwhCT6q3iLCJSfA1UJrfGUfAK1QtaqFQIb/4Jph0
 117G19bnxh9U6aS8NS+SVRQMEVa1VpwxsuzW1AdaazdW8qi631iDaYzygusOd/oFN2VuV4ffgvW2mL+FsB8PxYhERs5ALplFEVcRTmLpw6LcXUESAEWLPTvA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_084815_897644_4301119E 
X-CRM114-Status: UNSURE (   4.39  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.4 (-)
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

On Wed, Nov 11, 2026 at 05:12:47PM +0100, Robert Marko wrote:
> The LAN969x fan controller has its own register block, separate
> from the Sparx5-compatible temperature sensor.
> 
> Add a dedicated hwmon driver for tachometer, PWM, and thermal cooling.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Applied.

Thanks,
Guenter

