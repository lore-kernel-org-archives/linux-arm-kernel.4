Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97806606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2glj031y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IWrwMl13;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ClcZVYzf;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F7qQ+t4g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UCKdLvtYF+l2s45zdbmihw9ylq8RB+NI5sUQqtc5uaw=; b=2glj031yYMjV0n89jwfSPt+76G
	JLHolg31UuGfqKtufuqWHfy3Ik7c6e6F0H9lYTjkQPNXF1t8PM/tGBmEdk7Gjmc8eDH/CddAofqI+
	Cn6VRKlcEey2qm6LdHHowkVcZnnGY9WhZkxPE1AP+RHt3zIsCC81O0Goc+jQKodDtHqf23k/alRJi
	t4OYh1MpNI2wDoT6s5dwuuA/pKA6LtQTEMJ7YOzr+JIfPqMKIpgQpxi90/2ZgRo85SI8lZTj79vEn
	qBZYG05r84lZ5Z1lYfwtF6uUR1osoIC+J3NAGnmiXNqzJKbYqwTdunhATwiTFauSR8HCl31bATm5e
	/M9oUfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrer-0000000FJPd-1SIz;
	Fri, 27 Nov 2026 08:50:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWreI-0000000FJ5S-2e7j
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 08:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UCKdLvtYF+l2s45zdbmihw9ylq8RB+NI5sUQqtc5uaw=; b=IWrwMl13873uxlQrPaOSfP4Y9P
	1Eu55EWL+LnGDSsYcEi5IlwS0Al1QiQwrjvV0z54fn3zsejq1G4Aku3g0Abq5LelFFBf/FDCLGqVp
	KUsjResTGAcNtNo96SwQkpbegJKUCOsnbGXLpV7vw7iyoL5uWeEHNwuy9yuEo0RIwDZKU420/rCtD
	g91OQexYkkznRKyhLRIjR2D+LluYf6S7Da1opa79+Ku0Ziqy5RfjIpKF9OUCKZBiNzFquQjplhqJ/
	DCn8jqMjWw+g79vC7e9OA16OHGlk2creoZUAmQIMvd8TLUzpF5MBlk4xMpaY386R9P0qXnKBvov+5
	caR7dBVQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWreF-00000007TNN-1WGR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:49:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Goxa560366
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UCKdLvtYF+l2s45zdbmihw
	9ylq8RB+NI5sUQqtc5uaw=; b=ClcZVYzfTAmK0pxKS80A2unURtcIZ5ZvcGvezP
	VMCagDnxqulfh5vIEQz0EUhQS8pAGoxVHKx6OhoiXh6pmvMU3oOo85BHoSpdQ5Ed
	rKtTWIbdOMOEzyJBU0/uJjGMNsptHXW+Vcv6zHavLeJlaoBmPqZLqaCu7XwA44yL
	sTgFe9c1Uzqf/3+bWvvQXQ0C7CkLCPuszubG3jHDcdQCSBp85FP7BBJufo7IRMU0
	ZsXDbXobWAPsL2TgfCQy0bkK29YxVIJh2XVtE+d940HJUg8hWrKkHzA7lwlCJ6tR
	9S1J/+TbMl2jHMVfn4lyK1cWVue0lvZ9EuO999TVZbGd5gHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk38h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:49:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f021f3a9ebso13140405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769374; x=1796374174; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UCKdLvtYF+l2s45zdbmihw9ylq8RB+NI5sUQqtc5uaw=;
        b=F7qQ+t4ga/xJqVFtGqa/qw3cMeEfa4tG+7tDqOc5wHivrP7rGI/QfqePDKMC0iIL1O
         95+Vifr2qqi0kZVh1kJRQ6k0cAwGemraWnkNYtA6sKWGT27fzSbYsgH9fIktI20zzENC
         brl0OXeCOgQrkyp4xIRbrrRNpCIVzRDig4kqXBM/Fe26EaYGEHazIGOc7xcSq7cmNoof
         XG6CoPypce1KDVF7FDctxU4F7D39dBGi7XX54vnM0b87pvFspyN1QeiX6Xt3cr0zu5aB
         7iv7iEEuG7N6KYTJOo6Sf705OEiO5VRf46golwfSasABqVhqz8VaNKAXCKPdCkFJIb89
         11Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769374; x=1796374174;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UCKdLvtYF+l2s45zdbmihw9ylq8RB+NI5sUQqtc5uaw=;
        b=YfNJN8Eu5wcFJqh/UsQ4aD4NaudANzfiyHfJFckWcNnbCdV3o6E94LxXvfgkcKRxCO
         onh2y4OxMmRw/ZszZ/GXgjJn61tdOF+CsUFeF756Inca0SOUIjpDGm+YAABpzlYJAc6R
         T4A96ePl1yXRRvU1IeEEyCFkudAwikISOOeddK74PM23BbtGaRCCX7UOJbEdLdHmgwh7
         f0CXCeraiic4iqj2lC2V/AwEggKDyyogdbtwkesnl6l6cPaiFiF+aPi2fwjDHl2Mkmj2
         wwOOJxy4mYTtSqhNA2p+XNkuaLwlLo7f0DevzLdq5xy2RtdcpTpeQ+0UaTNNKbanncb5
         iDCQ==
X-Forwarded-Encrypted: i=1; AL+hErHtt/0P12+5jo9x/Xhwrp/ph5PTxpIwOsTLy0DqZtkEiT2/5CbVjEWU63E+rvFq7l45oa9YiaVjvwf3cpja+xLP@lists.infradead.org
X-Gm-Message-State: APuU4Z/Kv2au9iQQOd7+LQicXfnQ6SjEvZe87y4p73m70dspH36On0yf
	Zo4vPjVdi2MshGrJcJxrH35QQoKcigWRpvzzFFUCF+fOd8UJYMXCZk68cX06mUWSrxwMUD4cTHG
	xFcPaUaWAmBOQIfjGHPzIjOtK9zkmE8MLZ2SNM6kJlPcxuoAX/UhT4uIcU5SnrCQKwmkF5V85Qt
	gmlw==
X-Gm-Gg: AZFdTZfRCJ4b6MG09iK6Ypc4LoFbl7GVOJweCKWd0tjt1WMSpbK2ifKDR4mxdsF5zRu
	5Bd+Ej6ePA3IzWDTqMCP/uofHUdi6HJC8dDaTIQLFxAKsrQPKYpvNk2QppbQew4AYqvCVj5N3Te
	zGE00LKCYzVcsN6uliMM86ijFXMbs1ZTZzP2pxfiFDI70W+sGUcG+SuuOa4xu2zb3Dn2zBOUh/+
	UxXvd5TBZT6ZdqVrUm0Xbr9lfi04xDplLXOctKc00p7eJeJT524cnW76yXQhrUUfacRxMn2w/6K
	HvoKGhbnxpNxOPIeYX+iSOoA2cz3Rf9OlUg9fCa0yEVY0ZDO1pY4akn2lhS0RDZx1CmxR0IF/pP
	tG04c8CS9VkrR0BW9mRZ0MXYQA9W0iZ4yh5X9lKac97QyPbgz1gb9CEcdWEv9xdq1mxAvm9Eytx
	8mJQZ/02NJKtN/a7lVmbl2U7OcmLKX/0j8eM1tkrlAa9H4EwNRm8GzZIOntrrrI+ilcQ98MwHei
	ixnc2IksX7sAAsw0TonVG/4sDxjNQ==
X-Received: by 2002:a17:902:f70f:b0:2f0:3956:3a67 with SMTP id d9443c01a7336-2f03f113631mr382995125ad.1.1795769374165;
        Fri, 27 Nov 2026 00:49:34 -0800 (PST)
X-Received: by 2002:a17:902:f70f:b0:2f0:3956:3a67 with SMTP id d9443c01a7336-2f03f113631mr382994715ad.1.1795769373681;
        Fri, 27 Nov 2026 00:49:33 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:33 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: eliza-evk: Add display support
Date: Fri, 27 Nov 2026 14:19:22 +0530
Message-Id: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABNECWsC/3WOy07DMBBFfyXyGlceP5sIIf4DVZUfY7BwmjZOL
 aDqv+OmXcJmNPdKc+ZcSME5YSFDdyEz1lTSdGgBnjriP+zhHWkKLRPOuAbgmmJOP3YfUjnubc4
 UcWuckH3UKEg7Os4Y09cKfNvd84ync+Mu95I4W5D6aRzTMnQCemBaaNkHF41ngTmjtwhRaKVQe
 hW9xuDUDT1iKXYVGrrnh495+GD9XJ2y/aaVU0ZRci60kNZy/zqVsjmdbb593bTx8h9O0Lz0bfG
 0GlqhbyCIDrkzTnGAP0C76/UXXPnJN0QBAAA=
X-Change-ID: 20261126-eliza_disp_all-ee87b349f6e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=3470;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=iTyOANYERgzLPI3cYOnGb33tCzPP/UpXYUtL/Tdax88=;
 b=+vxA2jBLA0nnLk3uG5jbE2Q2y3+oK4d7JKuf1OyIoKNFllimtcO7rSvPQZyotz1zbyfkcAMRM
 aqcSQ2JUDA0CMOJtkz5ESkJrgJMDm53yUKeqwCWL4FWPayFqRBqDm47
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: qmATVCdWWsz_SM9QbOFQYPeF1DUwa3L8
X-Proofpoint-ORIG-GUID: qmATVCdWWsz_SM9QbOFQYPeF1DUwa3L8
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09441e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=etoB_AOsishmf5gppmAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX+gC7ArkoxSt7
 fPwIPo203ZhonUQiGyeiwuun0xQz9kuAIbF901XjNW9JtkQy18LDwkgsmuQ1vW7Yc8S7ldnX/Hx
 XocJdEAipe4aDqE/6HARtz8hsWZKd84=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX1tsiM/or1iT/
 5GD55BILVi9lnHZAxrzyXMT1HnOMZb+vpI3qH/ZCFjRLnOhk5VN17JFuxbLjXPIsWEG5IDcqiJ5
 ufz3dAwagUPIXKfg3/VsqZOj2athtmK0nVllQTN9S72xFOxaKean+F0SCV4l+gpgdJ/4jHlvqPI
 HZ88O/xAwYU1PMl4UU53MRz7PLks9okIGILLVboJ3Md7j6MrUguTryKEv8V38Gn6dIX9Hk+g2ze
 9sy9uvFx9ws4rl5l0i41qk9m9xhlDmZAzn6+78PH07AgOH5fOt7Y9dzON7pa2fJXnHV1eaWhQk1
 Oglkcs0DtC4ICszQLZk0xqkzQhomz9kORyn8fcGOJ/d/N2247xSAgExXow1fn9hQCuoPGzFo2Sk
 +OLCs+gL9MAbt1hyM2iUBqUApn5JaEx5NKpaKPUh0Mi3MzL7fdE37eOecpVfl1f9xZTW9lME8e5
 TgyFa5bIuXBvUYwdnjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_084939_556019_B21813E0 
X-CRM114-Status: GOOD (  16.87  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qualcomm Eliza EVK is using Lyra carrier card which supports multiple
display configurations through the DSI0 interface. The DSI0 signals can
be routed either to the DSI0 B2B connector or to the DSI0 22-pin
connector, selected by the SW3.5 hardware switch.

This series enables HDMI output on the base Eliza EVK DT using the
LT9611UXD DSI-to-HDMI bridge on the DSI0 B2B connector. It also adds
overlays for the DLC0697 DSI panel and AUO G133HAN01 LVDS daughter cards
on the DSI0 B2B connector, and for Raspberry Pi 7-inch and Waveshare
8-inch DSI touch panels on the DSI0 22-pin connector.

The HDMI, DLC0697 and LVDS DSI0 B2B connector paths expect SW3.5 to be
off. The Raspberry Pi and Waveshare DSI0 22-pin connector paths expect
SW3.5 to be on.

The LVDS overlay uses the PM7550 LPG block for backlight PWM, so this
series also adds the PM7550 compatible to the qcom-lpg binding and driver.

Eliza EVK DVT variants also have DSI1 22-pin connector, currently there
is i2C issue for SE6 SCL is low and dual HDMI using both DSI0 and DSI1
is not working as of now, will post them in subsequent revisions once the
remaining interfaces are verified.
DT nodes are named accordingly as DSI0 and DSI1 22-pin connecotrs are
expected to work concurrently.

This series depends on the Eliza EVK DisplayPort over USB Type-C patch
to enable mdss and the LT9611C(EX/UXD) v19 bridge driver series:

- Eliza EVK DisplayPort over USB Type-C:
  Link: https://lore.kernel.org/r/20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com
- LT9611C(EX/UXD) v19 bridge driver:
  Link: https://lore.kernel.org/r/20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Vishnu Saini (7):
      arm64: dts: qcom: eliza-evk: Enable HDMI output
      arm64: dts: qcom: eliza-evk: Add DLC0697 DSI0 overlay
      dt-bindings: leds: qcom-lpg: Add PM7550 PWM compatible
      leds: qcom-lpg: Add PM7550 PWM compatible
      arm64: dts: qcom: eliza-evk: Add AUO G133HAN01 LVDS overlay
      arm64: dts: qcom: eliza-evk: Add RPi 7-inch DSI0 overlay
      arm64: dts: qcom: eliza-evk: Add Waveshare 8-inch DSI0 overlay

 .../devicetree/bindings/leds/leds-qcom-lpg.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |  12 ++
 .../boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso      |  75 ++++++++++++
 .../qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso    | 126 +++++++++++++++++++++
 .../dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso |  87 ++++++++++++++
 .../dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso   |  87 ++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  91 +++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   7 ++
 drivers/leds/rgb/leds-qcom-lpg.c                   |   1 +
 9 files changed, 487 insertions(+)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261126-eliza_disp_all-ee87b349f6e3
prerequisite-message-id: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
prerequisite-patch-id: 3f53927ff7ab3b9c84cd22df9e13cb5ff2be5f90
prerequisite-patch-id: 4217c9079706a6ab9ffc657ad73c0fafdfb95f5b
prerequisite-message-id: <20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: ac9c419ccfd8b3816e05867d6b09ad49ccf12a24

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


