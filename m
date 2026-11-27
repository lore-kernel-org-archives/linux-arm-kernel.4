Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F80606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2a/FaABK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YcL0qfny
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ixVHN+f6bXwbfLfqFXi/FG437hi5R5SCUVq9nvoVZsI=; b=2a/FaABKfYFs3LunyQUh0MPpOx
	2yG7Q4fBSJufrcNlbMnF6QMGw/T91Qb6NoAfU/G9r45dvEErXDv9OB+EhG97lSP4RacSZyh3MBm1c
	Vcyt84a4ajI2/bRDb7fVZHPRPKdjnKk7NV4sE2CQYg+l0nP/CbAqIfB2nBUDAjU6pDk20LQUMSmf9
	2tcZeg05lSmXvB/hb2QnOsKHVqYZ65B1YI9cvo5BlUSLwMTzn4NSCBhLvbHHsLuHYENRr8k+LaYl5
	dD1owvolr5FqNKdGTnWAwXObjWIOuIxDSErJCXMtrkL2kATvTiB3urnmTIOjEosJaWw+revj/OWKD
	4vqwMqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy22-0000000GsN6-1qJ5;
	Fri, 27 Nov 2026 15:38:38 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy1t-0000000GsAT-0t2b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:38:30 +0000
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id WwYnxI8RoVK9UWy1fxZRgt; Fri, 27 Nov 2026 15:38:15 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Wy1exLNT0laNKWy1exluF6; Fri, 27 Nov 2026 15:38:14 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6b09a3e6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=p-LfKV-GAAAA:8
 a=VwQbUJbxAAAA:8 a=sOfCyYYy1NGfjWDh088A:9 a=CjuIK1q_8ugA:10
 a=97BuGM4RKn6GwmfqMd6i:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ixVHN+f6bXwbfLfqFXi/FG437hi5R5SCUVq9nvoVZsI=; b=YcL0qfnyoM1bBp23CVqi1J2zfM
	CiSXjtSQ7WGuRmME88zFXxggvDHzcN55VJ2FADsqbqXksEbU4FgbKbtczbcFrItzUBqP7ehb+VRu9
	aJ4m0h5qAiNwObhhPlH1AiEWg/JgLuPRwprU+kwLdmCwdpGSaDeoonKUiZ8bdgjztLnscmzfC869t
	eXHDiaHA8nn60bNiYatqhKXLUKAJXmN3rLfnxs52tS3+xcnhMVK02XjPPK2suwTPVqXZmUMJ4Ik4Z
	V+oPk80B2Isk6XZ3cOKiII+w/fmFYJVgl4aBna4RR9RuC7v1vNbYGWiS9Su94jiFPA1LZraFZTBP5
	qo2h6kbQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53908 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xWy1c-00000002P4I-45YY;
	Fri, 27 Nov 2026 21:08:13 +0530
Date: Fri, 27 Nov 2026 07:38:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: hwmon: Add National/TI LM77
 temperature sensor
Message-ID: <1c56cd6a-18f2-4104-9d5d-1c6bff6dc848@roeck-us.net>
References: <20261126124402.3015577-1-lukma@nabladev.com>
 <20261126124402.3015577-2-lukma@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126124402.3015577-2-lukma@nabladev.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xWy1c-00000002P4I-45YY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53908
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLNbz/+25xZukc/G23bh5gNxgHQqdUQPWSlNbOoE3+By3C46/Q7wUJR6fsBI3XiTOQSC2XyO69txjBxYu0xPS5b+pl+EG9eX/PfqqWgf+vnDYpu1nh41
 23sXLicyckrtZ7nxO6+ayY5QlfioLWGo2AtyQvKg8gqViMAXSkPz7fu4Bt5hyZYgzraXzzvWpNDzlktPv4OwK73Tc53Yafo3cb9bHyvvYX5DWBKCcFMaf7ZZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073829_313780_27B11C97 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
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

On Thu, Nov 26, 2026 at 01:44:01PM +0100, Lukasz Majewski wrote:
> Add binding description for National/TI LM77 temperature sensor.
> When compared to LM75 - it has two output pins one for interrupt
> and another one to signal the critical temperature alarm.
> 
> It also has only two I2C address pins (A0 and A1) - possible I2C
> addresses are: 0x4[89ab].
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

