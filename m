Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF511606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GHQaCf4e;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqSY0Gh1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRtnmWoJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=; b=GHQaCf4eH0Da0n
	vVrVT4VjxGlzDHVQdeAwKnJP44tM99QN1Exqlk1DETgWrC3cuybqZThTCniImi/AhMn4MvBs00to4
	/Ik0SfrrimfNcmK+arRz6+pxO4jcKB5iy6Sh7JRvz59+KBuugCMFEfOiUKoPxAXr6Cdcr+yR4xCb1
	/WiMd2nR4JJJLNvCGQdVTeguVuRV7jXmfriUYHsdq0KXHrd83DR1isTnFtjttP1GRNuP3jprho93T
	GImRIqPfUc7u6n8TPTDLB+5iXrijFbA9UtqGRSTHsRdvaou6IMZuXg+Km3UEUlo0Av5qmNHVGhOja
	zFbJpEv6lh2mV8P66QSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWFs-000000044GY-3LOG;
	Mon, 23 Nov 2026 15:46:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWFp-000000044FB-2zVI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:46:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKqlP2621974
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=; b=PqSY0Gh1fTy0p9/x
	thCR1UDcwGizzcDS4cNyR2czaiCliDa+oDfPVvpnWMobkotiE7JwsMPh1N7k17K4
	UIBCZdJi3RxRPSP6idQ7T9twRX6i4l9aHf0G4Gv9dc4CGp419YlccRgJKp3hXikF
	+xIyWDuWjnsWtbAhU7lpKq682R0cEdvBKMrnF4NQnHwjo2dismK+Nz/f/A1c1ZRW
	kmJzENg5X4dEYjIsFUj6bdDgMgN+JjGLveuea6/evWWdK0lLYqGn0PkEo/KQHD7e
	jc0uz96eC5vcpBhJ6lPHYzqnxstppijENZNyJdgR8MTW3jJGFosA/wuZ9AT5Tf60
	A8AZnQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa5w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:46:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so952536e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448811; x=1796053611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
        b=JRtnmWoJW8GpN951TbsX1V9ljivte6Su41/LhcQs99ETaxUJdFtmrocG4m3z4DN0cb
         JcSt1AuYG8nNXRns8WCB0NZ/cZ+ZnqBFU9qDVfoDaT8hBXU+C81kV93bMbnp7Y0nxCXo
         Ye/2Pk5OMoVFweSdu0dd7qA7pKgQofV5osIn7R/74ZmV3+DIm5xJ8aYgzVYGjdTBWFyp
         SUFjGx27Ydcm+rtYiu40Pbl7/j3rtTtju8ynm5+XpLThn1XcOLxwaEcgv7y8yNjfue/h
         wsJN+uwmU6a2SZrsplQ/f9R5XzstbolrmvyRp+TADuYZY9QtygXJjH+7XPqT4j/BuMbV
         n0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448811; x=1796053611;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
        b=EuGUE7bWA90gRPdbAAvLSGq1Tjtk60IEnGRK3LFWlGoK6pYlWaJt3jwrG3ycT5QYIs
         OasnjrjL3s1Kub/qDMOGqs+gkdzF/bVF4CkvS+cRJV7Vd8Xz4yGTDfVCZzLMYl8LJjq4
         z15iiJYKHvk5mC5+o+I82E6kMOcD0/PyBff239IAO79okCG3LijEey3OdnCJuCnnQbBy
         3xUkMDE5Q7vCNBFGoANQkuOEdVAYSnkCj2ZYJns5l217aTZtLQyrhGuPFWRd4fbZbOGD
         //PzLwwo5r2/B3WM5iWPQQ9y/8lhCKhNUvzD9xyX2LmNXDnrS2NzNRDJhE37F+/dlnhz
         xGyw==
X-Forwarded-Encrypted: i=1; AL+hErEFJ2Dxn7MfPD7p2vEvOD8ehfEzrYQW12O0uSYCcVGW+jNPqnHgLc/gFOONiF9ApxTAPBMJKyhT98/r+NOC2Dmt@lists.infradead.org
X-Gm-Message-State: APuU4Z83bwaiFkk1m39hTPoMemwQ4/EYNkTPoGqzIElRtPFaepikCnrW
	dvl8dNLzv3mBL/J/AV1HChbGhxRrrfSxi7wZEyEPL9yT4lU0WqpT5vI/lwlZyIvv9/v7SRHeU6/
	dStBbsv5myCYxrswPmgcxTicqb7xlc/EIvcqE5LljWBnjDsHOYpqdU6eJJ03mVsyl5H9eYvKzuu
	WdBQ==
X-Gm-Gg: AZFdTZe7DfyQLej9AzxBInHLjYFhQ7/DJI7J6HJEXqfPTEuHWx72TqjyO2gUAhn/WSr
	ZhW8fvTtcHwvyxW/E50oDqAJs4CKiiL0bnqliDXwJhB9TUvjrdw64gVYJ1VbzxIO5Y43g7Tpwn1
	d+lQWgFV4hU3s7Pg941FG+qOxx1n+D5MFwzuNCCtuEga0uve8Ea0pePkuLfsYkVLJoUPAYjL4sM
	R3yWMTKxHY/KA2VnvUy8AnjSByNOk+kV2yYTviqlXa+kZZ74lMJ8LprdLhq7t61r8z0htfFPrGX
	/50US26yvTGjI4Wya33nLMBRuJjx3K0r1n5rAw3DwuqrOomuv/qLeG7TC4zFyHaHN6EmrkLRRK+
	zpsOpVMWjVFyhaL0CMziHpRxIDiGD4PFOMtz9LrWoBCp3lE7uugJW7ezCqhC6sh72dMr8H8+cot
	ZpcsQVCixGLHNBI575G2+BNggVofGXSLIdnYY7KnQ8uzKa8w1r7JlIl5y/8whjBA==
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr5860619e0c.16.1795448808792;
        Mon, 23 Nov 2026 07:46:48 -0800 (PST)
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr5860203e0c.16.1795448806310;
        Mon, 23 Nov 2026 07:46:46 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm133705685e9.3.2026.11.23.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:46:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Date: Mon, 23 Nov 2026 16:46:43 +0100
Message-ID: <179544880105.88036.6302106975992553295.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
References: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UyVgSAY9Ll3KyG-kcsFB-hV4DE7RQwhl
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b045feb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=d7jqCbnQutjosXn8mJIA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX4nkqJHFzGOl5
 zujImOZygXhilp3VH4Bxk/wA7LSFk3peLY1D5Vjt84E9gpf3VM8FTgkLyVJkx8az03WQoz9zM1w
 88KhNBmrQWSnJO6wB3mtiUUmvG1yIoQ=
X-Proofpoint-ORIG-GUID: UyVgSAY9Ll3KyG-kcsFB-hV4DE7RQwhl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX6ZwdELIEZtVb
 SN7Y5wvqZLmkwdj1wK5iaRfhEbixBnheOVzbWoG4kdsnH03NAjN/55EELr3POD6eJAM62pKRdAR
 wFg5t3pkDsKE9WESPMNnlwqpyTagMBwpfYRC4XKtFv4yjkGT/0rIMNFvKTF2iuFAUm6VL80EkoZ
 4p1TgDvCY7dmNfhE8OeWU9TvAoOG93XRluVRY/LEGXKjio10XQEXhJiu9uOb/aTWtOB8mAgJLc2
 5WELRXFs7Ex/DChjPuLRIwam0Ed4pe+F0AfQwrkmhDCQuXldZuTpY2usak66eC2czqY4cjLJrld
 H2BgziOwqI9HTjyCEfLOgsiNk+5vSBnlYpk1OA+/HvtR8d54rgMtM3ge+E4FuBbVC51Asrc9AqI
 wb0AKledpNpFYDHruSn5Celp/6r0xNnG+QVepcZiwYc3zM70S6FYuxUDm5ag6vn4y1bBRYd7llx
 9H2SkMGGbeed/+CBR7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_074653_751649_FD959DF9 
X-CRM114-Status: GOOD (  16.61  )
X-Spam-Score: -2.8 (--)
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


On Thu, 19 Nov 2026 18:09:07 +0300, Fil Dunsky wrote:
> The Cortina Systems CS75xx ("Goldengate G2") SoCs have five banks of 32
> GPIO lines, each bank with its own interrupt. This series adds the
> binding and a driver based on gpio-mmio; level and edge triggers are
> supported, both edges are emulated by flipping the polarity.
> 
> Each pin is either a GPIO line or belongs to a peripheral (NAND,
> Ethernet, UART, I2C, ...). That choice is made in the global control
> block, which is not part of the GPIO controller: as discussed on v1 [1],
> the driver does not touch the pin mux and leaves it as the boot loader
> set it up, until there is a pin controller driver for that block.
> Testing the reset button on the Securifi Almond+ requires selecting
> GPIO37 in the global pin mux before gpio-keys is probed; the current
> boot path does not provide that setup. The tests used a separate,
> board-specific setup step. The GPIO driver does not program the mux.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
      https://git.kernel.org/brgl/c/9413109c1005d207ec6cc3edad820d671c4d73a3
[2/2] gpio: Add Cortina Systems CS75xx GPIO driver
      https://git.kernel.org/brgl/c/26a9a31378673ae7da0f2dbc706e2c72628405be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

