Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C409606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gqpZ/iXv;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Db7ugddb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aP0HKF1Y4kyUipuAWkIw5ff7zQHGrIr+0UoFFBdTvm4=; b=gqpZ/iXvDZ1Lf4
	3JbMs833dDHkDEwWJHSoeqTF3MFC54wZD5HjjLL3/gNmaqbxKW2feioYwSf2233l9eAFxlv+/d4Uq
	t5OhR0VC6JGy5LHD1oZ2a/xya2QIcN/IQtIOYNnxbEPlNb4rLziOPBRyzmfVrV0H5G28fC9lHH2B6
	PLbGyJvaEjQdupAP9RxNxjNu46J8JgFJ8Wqk3kpWWcvkVU1s1fvvzaSw7ZBSWG4ZYKCLe/M6G9NAt
	x9FSZstmrQxuoviWYtjeZmmAgT4wj13vBd03KQOdYvVPgAOFDtDppjDAPUujILeZrgtpJqTk+enF7
	ymQReb4IVDa39PmMAQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpAT-0000000CU9S-23xT;
	Fri, 13 Nov 2026 11:10:05 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpAM-0000000CU66-0wnw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:10:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3BCE10BE6E;
	Fri, 13 Nov 2026 12:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794568191;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aP0HKF1Y4kyUipuAWkIw5ff7zQHGrIr+0UoFFBdTvm4=;
	b=Db7ugddb3uRmWVLzG/X/epdSB4A/gZAo/hVS8jD8Nki58Hq86gWjE8FGjm2Ppd204tYMCG
	Cygj0jRcuQt1WeThqtBIAYnxPRuROckC42hDv3ARyCZVc9BtF4X9YitlDzC1nGjK1G/in0
	1+N/wagugPPLNzfZ07SpeU/QR6knDBfyNXCzhpc1pNP/f5rwQbBNaBIikb5Z8qC0f627nc
	X/sKyMvvaRtwYAPjvIBe2SwdZxtabaH/CraitCOSLVnZU7g1bxwFTL47qlx2fJSEnesvFm
	8gGMqx8MAAEcam5BjNGEc3/f3YEBqNFSAICAW/NMTnYqeiLyPCHZtyvz4VpMCA==
Date: Fri, 13 Nov 2026 12:09:47 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Daniel Baluta
 <daniel.baluta@nxp.com>, Jonathan Cameron
 <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261113120947.6c9fb820@wsk>
In-Reply-To: <20261113-roaring-relaxed-oryx-5cfa1e@quoll>
References: <20261112163703.3358164-1-lukma@nabladev.com>
	<20261112163703.3358164-2-lukma@nabladev.com>
	<20261113-roaring-relaxed-oryx-5cfa1e@quoll>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030959_016958_B16146DE 
X-CRM114-Status: GOOD (  12.26  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

> On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote:
> > Add "national,lm77" as compatible for the National (now TI) LM77
> > digital I2C temperature sensor.  
> 
> Are you sure this is a trivial device, not like LM75? No interrupts,
> no VS supply? Datasheet disagrees.

In my case the T_CRIT_A and INT are not connected on the schematic.
Moreover, the V+ is connected to board's 3V3.

Hence, the conclusion that this sensor works as "simple" I2C based
temperature sensor.

> 
> Best regards,
> Krzysztof
> 



-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

