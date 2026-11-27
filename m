Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889DA606A6B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ilez9laF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=C2oJNNbt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lulB0Jm0;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kFY/mUZt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=; b=ilez9laFqy7gN7
	TZS4ybo5IWaPvcqYDvkOhDJFRE/pS5lRheVjm3LI5pJ4frvjtA2yO41dhrbkNs6nMp61ZXDj9sDHs
	JJHeNJ5tXiaMEgAsxpUOaS5uHMiGlktSslplF2P1J05nHG1STqpsWKwk/GP43iTcM3MToDqUPDjll
	ZqDC+J5pBd5fNrSee3nG8OD8YWW4jUVfYkhFdzBr2VOjfC3Vhxw0yBIjCbCxOQ233Kz9+cMjntg8K
	8cdzBb2mN+19Hx9yYw5lolP0IyG1fdLCgYoTk1AhhvXIGkN7ttZsMSAZN1m/O31wQAuukzjOfGrq6
	6aaPxdYlVd7jrKkfuQ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwxm-0000000GXAt-2Ulb;
	Fri, 27 Nov 2026 14:30:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwwO-0000000GVW1-0HVC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=; b=C2oJNNbtGGk7jm9/NPE4bY/bHa
	+uj6R50WgutMAWiu0dWamPFcQltOeeEiD4X3YgRofZTO40f2MrwUqO/JKbTpHNyUjL3ZjfvUP5B/n
	Pp6GgU6d31N3qIh125ZmvqRnd/Fgsi+N2GPg+8TDO37AzNYBPrm/lI9Cy89EEtign0oejbuaFM6iz
	KOas/s+JcPVijV8vSV7pt+dESDKPFib8OPunXQGWWw5dxinehHobCf4vBvqRFWZZtg4xC6yovD4rB
	AY/d9Nkdzheznf/Ub+RRBiV15HrUAeSN7KR4i0gjnfmHg0QDgHTVV9VHtrWg87ZMQNEEPvvqzgoz1
	l3TT85CQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwwK-00000007odL-0yS5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:28:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1GuM2683853
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=; b=lulB0Jm0sBwZApTa
	ocZKVKaV6qr++oOxS1yVEAozW9+QnCdQD23D71LUCQ1l7S1ngXwE/hoq3j4SvpYT
	YCDCz6sRjA00Rlv/qS8ZQiOx7hR3XsRLDnZXi6lnlfYhRyUJfISPlRCjeOY01fOK
	czf+KIT/23+9vdGumgBa6euC4Nj1nH+3z0emeoabTYvJ70mnSe4ZQOlCVv2ptzNO
	FJSiAHlFSG2ufWZPemjmOO31DX35BZ/mlcXaC83FT73qUdYZGyHs9YUod/HmECOR
	Hb4B8gxrYAiU5PNsnd8JDIpVqrQ6VcvLIVLrqekDkp74M8vtZ8ZbnbrVxmaHB5IY
	6avXWA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhj1bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f08196b148so53847905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789717; x=1796394517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=;
        b=kFY/mUZtosURaZlCiADcswQfshKJLAvm/lC24sAPNr9mDo7dtJm6pB/bVcB4ouY7ws
         14/f4jRtP0ACqWZaGXlGd15Paq6WzCSLwIuKuZ/NT7vozA5iKHjE1UsLbTlJ08tj7qRi
         IHchfhWTzfdItQsx99BHc+p+zPRLVqZ+dgAzvwY1tcocK5sh75sIFQ1e0OWbUusAZkFl
         RHDo5T/WQ4rhDokJbh+6IYRwew4/oVlBBtfuxH3N7Rh8QIoDgmBl1vCfHsLTLdUrtF6t
         Rs7lmugTpU+KM5o54UemEINN+OA2VseOaV/fJksgxtaIUulvIsjl5JeAHLzXniK4Aekd
         O3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789717; x=1796394517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=;
        b=iyCLXXZg9o1XId+r6j4fvD73LB4C9GqbOxUBPok3KghKiSNBuEk2yku1A8PUYeWPMg
         O+fXgEv1Ejkbl+RzghMVQG+mNZtmDGeNC8Ma5i/0zzVywopo7jLheE8Ge8FlxQnEfN3Z
         qMwrD+/r6P4p9ucmb8L2iutKxp7iyHRQg0zRtvtqyqAz9WreDrwTv+D3PPsA1CfDCTK6
         w5N6iHhYgm9t4yV3r/rd8kt5gJdFUQu4kDrDKl3V7m1cvnW4KVd1bm/ac/qzheLjnDZu
         CEwQ6NaRpMWlu0JGj0bagX3AOu97cHSanvPP6b+oLW86GMio2peOn2MvlBSsaqKL9Oiv
         +cdA==
X-Forwarded-Encrypted: i=1; AL+hErGfFNODpSVCp5x0vAkPdFTTJuNrpjSpKDOFioI3MEb0ZiSMoRm/Z7hwn8PrnIDTIliluDbrBsAnTM1Yq1cKdCTQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+f83Yn2FVwc+rOjWmgOLnXDYbY2VooLLiW6Y+X+Aout+VLi9zw
	cTjaava84RlyQCwyq6pFXmyvq1UbKXPoOGmsg42SHuhdJvCMarE545vo3qec+UFug9i+VXYNyJX
	Q/1ctya6gxw+fvT3USoXbuRBy6QPBmZzN9b1+XotZtgJ6Qi3jey4x1DLtJ42pwccCnAxmRLJy+T
	YeVw==
X-Gm-Gg: AZFdTZfp0hJtwe8ucILoG2ykCDim1xk7e4PW6uzQotHEz9am92jxALwCiIdgdnpIKd7
	mDBW/yj2d/6i2fXHw64m/8LV2t+JHwyfmqYFHBGD/FmqesogNzyGQ7RgexmAoxcexjwMnHHm0uK
	+bWScDdXuCrtzyDCgC6mRJPvdd8stJ+ZjgpvAaYJuImWiQCjQFHtQM9DCtBGVzn0hllw8+DU2WZ
	7hhKr+btwANgF1hAhXBXez0GyH06zUG7O3UvJVeIczVfI6/Jlj/4tN3jQOy7jrhGk+LOvDx2DP6
	tZ/Onxc3LfTWKTLJJRxIkW0iunV+M9Feu8LpmT9J5gCQ3VFhGZo0rUJAxSZHBn1FIQleCYvu9bC
	kF0bXT+U3JPKHEGgZisVzDlQkpvkTSPHBH/YIHlJFPmdDL8dRfbSB7jeZx80VSTITR/5SThcztA
	b7zdNOdSnSxw==
X-Received: by 2002:a17:902:e845:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2f03ef58f10mr266790015ad.5.1795789717290;
        Fri, 27 Nov 2026 06:28:37 -0800 (PST)
X-Received: by 2002:a17:902:e845:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2f03ef58f10mr266789325ad.5.1795789716664;
        Fri, 27 Nov 2026 06:28:36 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:36 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:01 +0530
Subject: [PATCH v28 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-8-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=2237;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=9Y63x7L/VrfGqCVKiXMQ6AYnOAt/WI1fwM2YMUVkWxE=;
 b=FG4TKnzLBLe9HV5AzTlr7b2MHYUXVG43f5q7Y7s9PtvUaXhNbwL2HMGwz2MozLLgIADtTWyWV
 pMafjfO+iWwDjSO+dR8pRdxRD1N3/ZyzPh0AecuOnr0+xXelclU9osK
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX4+oPMi+iCjpe
 uyVf4lZ+O1/GS7tZQwpyVEmPXpsKfOkaPUbiWXZc6VTfdhO5ilC8TarHH5PqxMHzVYjO1e9FcGV
 ttHpk2fly2hyNGKTko1PzyoIgrQLIrU=
X-Proofpoint-ORIG-GUID: Z7zbo5OX5eIMtAjUIpGYXhtHXfCtLYSN
X-Proofpoint-GUID: Z7zbo5OX5eIMtAjUIpGYXhtHXfCtLYSN
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b099395 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXzTHrDM2iHOgl
 E8O9u4F0LQZeONkFXTsm6BaxQufxeJA7x2gaxRZI433BpBlui6RSSAukfIsHhFKVtBI4nl1/izl
 L8IseAT31ax3bTwz4L0q0W24reHO6na7gDKxyIczGARQO+whdq9f60t8/0h6dNnVP8qlzB232Uw
 ylqapWuE6Qvm+PY0m2TOraWR8a0sS50POHDUtPXmNNwiecW3t4UN7Xbn9/fh3JVkYTr38O3aIgT
 MDXZlj7h3AG1TSFzjyOZXdIahgdyslCQp4LA679Ofj7fUH835be0YjPjfoXriRKdzuNGs1MT5AG
 MDvWnE4ZTYiMOiIxe/sUtzyKnW1E0ZZBPPheduOaTNQx6ttbvFsatvAqkJmjuTUO8MSWdvczE33
 uwvUh4tmz0vF3ttbn1Yt0hvDyZlJlZXArfF0yX/o2LtbrTqhB8tJXssq72FPypEIW+RoL1FipIk
 Qzige8E8a3Frz6ySsTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142840_417763_60BF1026 
X-CRM114-Status: GOOD (  17.65  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 603a3fa18994a..69617c4e43df4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -912,6 +912,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 22f764b8d721d..a530a363a9bf1 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4..a3f0eb587ba62 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -296,7 +296,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


