Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SINycz6c;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vt1B19sW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e9npgaZH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=; b=SINycz6cIowfVZ
	pdHOSNnLrjvHoE3YHo31pqKrsglxQSsAlBFwYcGWUiBBfeV3aks598DdSNr8OVP2+ncvlO194cIpK
	B8XbtYA3ljZSUemzFOpFfMo8xn9eIXSTLwv849FrkMpJcVn/d2CaEuUhVaaxPTSGQNeCP+1JGBrKt
	D+oFakiKr6Dr78rVfVIceGo7kqtfURai9oQeXOhVLQuMw6j3SJXD3TjezOTrVImBVVhQbOFl+OWx9
	OmqgMFb86eXwyET3ipVDpXAb+61WW5w8KOrbdFPp2Xk1fWoicG8/UKyc/d0ruRBW1G/ig2ND+3S0a
	j35tad+ifoZpaPLPT8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaGR-0000000DW7D-3Dol;
	Thu, 26 Nov 2026 14:15:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaGI-0000000DW4R-1LBm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:15:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVNli3177357
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 14:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=; b=Vt1B19sWIBBA4mMW
	vnVJHGWXmelLmC7j9BsDV0rHCG1XZiAo9Mjc8NNfGKQRkudTdyJaFO6fQEW5Kq/p
	UFigf+BLWjKt87EiEaq8w05xNwSUUKucQ2jBzkU8CtxyRb7GzUk0Df4blpTzWoKk
	iXwfaRxxE6jIng6Ii+ZLk1pGMzXdC9qhRN7nbgAhexaDMTRT1ydU70V+aAjxEcJu
	LXSOiQ5MS5xLN2D3xMBelA4kdTXDaQK2y/hCB26gmUW9WokQivphwXqJMXr0cui3
	gheHH4YotDyfMyuEisLUnjLqqljhA6DBgdJktjmikGhgwla55DI/iLiGvLeMaf+/
	4Pu3gQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbf22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 14:15:45 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67d98b79858so11161640d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702545; x=1796307345; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=;
        b=e9npgaZH2wIy2xVI7RAuVXMR0c3cymVAOXBVtuBn9h5VHsjBL2RYPczQlj5DB/Y1js
         sLs5YqvF+xmugwp3YDnupiC++qHotNFu0MKDKs6dd+TY7p0V+GXBxh1dR84TOLRjeKRr
         p//lg7WsXGow0mx90MoTz2o4USopVppR1tzCtFD04bc1TKhZXC844X07gSOZe2eOn4Wl
         BpNwCIwYmjv3XkMTvFWuVpDyhPtXTxwZtfn+x2/JvPINYbHXX2UIN7+uqmHo0zbPIIvE
         9SyFuyt2Dmbrk1CfvWJFto/S4e+9erXFyWoM+Qe5tPrLiAxikOAOkep5mdpVoXdpDO0E
         zd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702545; x=1796307345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=;
        b=c6YxlRXcUdXBfluB1+QqaZzhBn6EeMTPA5qTehw6n3/wx8K2sBnyQE+klPhIrAn5rL
         NnrvpNWr1R5W1tfP2Lq3tM6rbpMGpUXDIAQong2n+yEs67coQPGZN051Okvkswdjhz6y
         cfeharxvXO8Xr9emekT3jxS7ylTDwU1NefU0nw2+uBxiDJCYkc4JPmQn4y/IYRfziS0h
         szOwqlv7JT+vKc3rILxYWKZRpgLlIfRJRlMEkJVD2lVkh5m2JwDaRxduxTuaBXXN1ObF
         LuQFLVSht3La1K0SJ+8i0o830PQ67oaEfT6vIYk5r98GBtLWrXBgETVxKg/gfwdRnDQt
         dxwQ==
X-Forwarded-Encrypted: i=1; AL+hErFPge2lhCnDqyNHKDiDsJ6cLM5cnjoy9nsTKhu5igivXcGrQKqOPgNjlvksEffSx2CDU1DHJvdFhT2zgqAFocJA@lists.infradead.org
X-Gm-Message-State: APuU4Z/+vP5X9/QifMrKfSXRZ9hrYCDcgITGv901ePok2VPym2zZQc5r
	dqrCr/VXPs2zFhNJMfH9sfCWPpkYEy8vylLHzF1aoMD3th6/8GqXBkniOGxZTvBQMYInARvyw9w
	nck2WRBKOa+HJfYYvpRoiM2giEWngbt1otG/rz7lvmiqAH5hpWLxfSzW2taxAVwhvY/pwY9Q7bg
	RRRQ==
X-Gm-Gg: AZFdTZdoEy2FtgyTwn5ylTVDdYS4kjfZ+n7c0T/NAhO87TktXGPus3mFsJyvpikiOtE
	xtY0EjuG1plmBvfzL/NTJN1e/KPXgrB3UfaeHiVX7LNVouBiPoTedKa4giJZAfp8EP5dVwSbtq3
	FzvEx78VGiOQMAHhwk3P4LKiKeytEBiQmtDBndRyYlBX9Zh3IhZqp3GEbbzZEhklFuD/k2MjGwe
	z761D2bMNYDWIRskM5mcB/7QQ6EEOEbrjdoja2li9Yg5Z86F7kUw71UH6JzrmKTJnbuVkp+Rb3F
	/R5dGe9i/0p1z11R2PqmpeYtjQbj3x2xNzKX3FllTkvf5XY0F3OxOcYrvJp7k0x08nfRS2yOKkO
	bbVJcrqLeqO6DDuS1JDYKU1L71fUWwhlt5AC2BKdmdB+ARDg4aMTR3WVfL7k3TbiRhbk4YuiDGk
	e2NOqA9j3/Wvc9ijTs+3JLurw0GMrqaDTyOFJyneV+u7Na+u2p/0e3D27sUM+W6Q==
X-Received: by 2002:a05:690e:4004:b0:67d:bedd:494e with SMTP id 956f58d0204a3-67df40be117mr12076966d50.0.1795702544969;
        Thu, 26 Nov 2026 06:15:44 -0800 (PST)
X-Received: by 2002:a05:690e:4004:b0:67d:bedd:494e with SMTP id 956f58d0204a3-67df40be117mr12076951d50.0.1795702544570;
        Thu, 26 Nov 2026 06:15:44 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39706018f8f.30.2026.11.26.06.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:15:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Vinod Koul <vkoul@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
        Stefan Wahren <wahrenst@gmx.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vincent Mailhol <mailhol@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-can@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH V2 0/6] ARM: mxs: add EVAchargeSE board support
Date: Thu, 26 Nov 2026 15:15:41 +0100
Message-ID: <179570253918.23340.11898101233717977206.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112130506.12823-1-wahrenst@gmx.net>
References: <20261112130506.12823-1-wahrenst@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b083f11 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WIf87rlHEhZ3lBRYjGYA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: QFqMhiUztEABZTRUJbOVjG4-J_2qLgpX
X-Proofpoint-ORIG-GUID: QFqMhiUztEABZTRUJbOVjG4-J_2qLgpX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX0qfjDzRqkj6A
 yz1yJxVZW68hIt/T6ZzL9M+cf7gvE46lXvOFn4cR78osfyc264kvt74T0cl3CEueqhfUAE8ToNr
 Y+eje9kd6TOSkpEM1dHvh3oZNsbA/X0p0OdEiLaNOMF/q9zUIKxpIzPULD14Ux5mGVUWpqhSkxo
 /oC8GCK3YhnSCQ+PxL6+8ucDsEMQeQ+l4soRW0/l5PQw4lvWRX1ggiRkDbEq2Tn6Rw5JYM88Oeo
 kENbiiFj5b/6OHpqs+JBZb3iU0s0F/gGie+ScisohFtUhaW4q56u+O8NygL3jIIpM3WOxyikBHt
 5gHpNNKiKAZQuCvln2EY96SUikwyHY8aPnRF9gDA2yOcEj/s3+8wzGXy7ckijBmrjY7Wta5tT4K
 Tlrj2VZoFTtTsFnJn1vJD6W5TAyZ4EbcQBbwJfmswKtlR1SrkE5B0xewrso4WN7goQ0mgdWJ4ZE
 Trku40u/jzbozjFP6Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX0MBcBlwN64kx
 /DEU5l5eV2Ld4MlPRcrEe7N8gsBOFcgE2Kan3Yeo5DBY2ohQVOPvlceTpHDzUOcIqsReXBF4JZ0
 RZ2m9E3b/w2bsVtniiFmV17FZ+bTXik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_061547_988063_155A003B 
X-CRM114-Status: GOOD (  15.28  )
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 12 Nov 2026 14:04:59 +0100, Stefan Wahren wrote:
> This series adds support for the chargebyte EVAcharge SE, which is a
> ISO 15118 compliant controller for electric vehicle & charging stations.
> 
> Changes in V2:
> - add Krzysztof's Acked-by to Patches 1-3
> - align writing of EVAcharge SE (reported by sashiko)
> - add "dts:" to subject of Patch 5 (reported by Andrew)
> - add PHY ID of LAN8720Ai (reported by sashiko)
> - move enet_out clock to MAC node as in imx28-btt3.dtsi
> - adjust IRQ type of PHY (reported by Andrew)
> - add new patch to enable EVAcharge SE peripherals in mxs_defconfig
> 
> [...]

Applied, thanks!

[3/6] dt-bindings: gpio: mxs: Allow gpio-line-names to be set
      https://git.kernel.org/brgl/c/0a74985977e851196d69e5364f4787adb03a5fb5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

