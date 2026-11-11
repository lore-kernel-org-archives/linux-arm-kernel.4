Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j9dXH7RT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUphMJ03;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DabWLQVr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=; b=j9dXH7RTIMM/u/QnQWqnFdrXEJ
	zmF7ku1gqlfMDjBzLBiPT+vFysql/LE3gIm6Qe2YqAJh6OPHoBzhxy2HTfmjRNek8FR/l2sWeggFt
	sWMFcLx4YBS5VEDHNIoiJja9UoM3dgjam9aVEL7eYE7X1YUgDRkmMNZA6I2nNbHM8Hcc+poo7cGSZ
	1TK1zD5Rt7W+5s8+308Uh/mLb69iUW8XD6I7p9XhhJkLZTWhlBfFkec/CVdUudVG/UAbr43d8wBzZ
	zkYBSDL2kFlOw3ReGoTamosIf16daqlYdIPR5EuvV9OyV/LXB6iqFGVRMv7kLwzIib9LmWzPxQds8
	4nj5PBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAzY-000000079fx-43zI;
	Wed, 11 Nov 2026 16:16:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAzW-000000079fa-3hmu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:16:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF04sJ3597117
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 16:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yN8rEZouC3yfilpL49Nn9r
	YRbZQUqv2Fvy1imuPZoCo=; b=JUphMJ0330lneS4Ke67Ym/G1OlfGxwhhr9TBaM
	qzZJARTt2KTVr9oBC6yMM1gyGqszmGF9ukpOZ26JDmNUb3DCUIU4vIprmhTmtfL2
	hURWWTVrHopLFC/EOdvLfuyj9NkEtkm8rXvyzXs0ne2khAnLq7sTeGyCFJm8pn15
	T+tuYMHDR0CJg5iVif/L1zayearw518TC90g46csH87sQ0LoPn2frYTAbpki3aLJ
	hQi8GLqYijsiv0T1WkxjZ10tcO8Ol+jIovD5ABFi+tmGHtSlKN0Q/fJD9U9NJTqJ
	h16Bg5pEfxt0IUc18HwFB2Iz4H+Pa5XIDsjNMMEMgk2+cuNA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u8h2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 16:16:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b238436265so1628675c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794413765; x=1795018565; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
        b=DabWLQVrL5P+3818psAafOr+1eROsrBRFmavO0VNdiJT3deC5dT3fOX66H43BGJh2+
         FaIWZPv7GU8D/b2NeqJISGKqrrwxHwUxNb65sKCY2uKYyYCDf5zs31+F33l+6sABPmY0
         xUBIJwZU4bDpUkzTGR2P9CKMXOhNEH6Ien3xgYcbOwxvMzDMsJhwRnZ1rpg6toTvHY3a
         DS/UIp88EhnpqsM1vEWBgJu5Thj+EJOcnqlaoXqFF+yi4ThGuiWTFhdemfARYcD44Bro
         6bVUGOzT865hqic8QohPQyLYRMxB/u0CcEfoBObstnIDY5GaZm8VpQuKZfrQ4AsOo9KW
         WVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413765; x=1795018565;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
        b=pzrH5SEZhEnWcjUpHW3W03bw8DZCk+mK0hZxPe1mfNGCg3UBS7pjgWbELoWXpEU6QD
         m6r1qNeoKsgspBRBHvTjrMaPqA6uU0IEDyrPkPPqtG+B1yFJdgqL/nVzXdikRi+wBpE7
         UAgQre7SUJCDLCnyshC1Lw+VBLUxmswnpqNMmJQHQt73bZEcalZP31vfBHkZ2XahpZlB
         CpawyN3iXfshtpfn8NBcHNdTzc39//kohUa9fGTD3WS6UYiwY4ZGSVQuPDuRoha+YO7+
         5890wLayTNYYjvm3QtsmnvytryBK0gYQ950Yr3vMEfA1kd+lO2qSjIUvjofWIiDY2mTL
         CLyA==
X-Forwarded-Encrypted: i=1; AL+hErGt2woBu/nPisfl5A6OXXY6zqs/QuoKEIoA39+Ksghbf+tD7LIlaMA8FFuQtZrCbAhfSFQkpS3fFqtjQ2F3UrPQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/PPF1ZMaNjgszjgE01SJhWbCK541Ecr+2YUqE5Ss/97nmoQe7l
	PTIo0+Q9nX3JdaSw6hGAMRd/oe/Le21vQAEhp4Fa1LcA9w4ThLY5jihE/xGHJIc/4Nx9FMcHYCL
	kjtRgTg15SGo5CgsGuBmQWB8qlR6MOFPeSd8nM+w0jqO4t6D7wofXcIvfw321rnTKAoKgrj+y14
	foa5KcQgGSew==
X-Gm-Gg: AYBFou3QDmALnRwWbVEnatDuQFFuSCFf3VfzoqMGeGikQWkPe06/hlCeM/5HQkfv3GW
	D1IJYP3TULOJiP4p8PeNkR1hQuPIYhUuHz/yqEpy3C7FoOx1pK1HjenvYK/tyxVsXl3fxO9V5eH
	ZT0XbTtXt4RcBizzF5zjdBr7DYx6wMLYU+4P81IR3KFP018IxeAo5eq7oY81hTRrnn40d37L8Ad
	DMM1VFEHxHO7+9P4ta0TshNniLf2qAgTVSQl3lM2Hji1cHEKZw3cUitVXivyBzzYkFedSq37yic
	Nac5NkGIbWkL7Oc6gZmHpE9aaq0FyRSxWE8hHcJl60tvXs+dlO8KvfocJqCt4SxyeqeHVTo5K2e
	BqFqIO0M4hL0Jl/+TlAbqLS2k2t9WDW1vrtwKYsg4AhRsl0gTDisCrG0MW+8wNlYcuw1H4M/dLP
	SDO8g7pKLGzXGHoespMc+7orR/5j63jTVPvs6vqby5TxROgIJpDhw8CFstdv7Au0ccyi3yEbX2
X-Received: by 2002:a05:701a:8148:20b0:18a:8164:ce4 with SMTP id a92af1059eb24-1b3c015056bmr2846275c88.0.1794413764919;
        Wed, 11 Nov 2026 08:16:04 -0800 (PST)
X-Received: by 2002:a05:701a:8148:20b0:18a:8164:ce4 with SMTP id a92af1059eb24-1b3c015056bmr2846245c88.0.1794413764380;
        Wed, 11 Nov 2026 08:16:04 -0800 (PST)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm23548337c88.5.2026.11.11.08.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:03 -0800 (PST)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 21:45:49 +0530
Subject: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALSU9GoC/yXMQQ6CMBCF4auQWTuJIGDqVYwLSqc4Gloz0xoJ4
 e5Webtv8f4VlIRJ4VKtIPRm5RgK6kMF430IEyG7YmiOTV+X4TOHiC4pzjRHWTAHTjg4J3j2xlv
 TtdaaE5T/S8jz59++3nZrtg8a0y8I2/YFspt2830AAAA=
X-Change-ID: 20261111-kuno-dts-memory-unit-addr-7f9fb954bb93
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794413759; l=1586;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=CSzQmEb5F718VpjW29JEnKagjfsiWXZUlmYmt8BWzBY=;
 b=FnK1YiaXFJxbht2Fknevak7wOF2gTBehm4QTIXKU84L4+P5N9blTlHv8WVyrtwPzDQAVQiEtG
 7QFwiGlWOQICfAmzPDYQYWjCrqBH3kui/I/QBiXEw7AFb5JP3sbmKxD
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfX6caInyVFgIDv
 /0D9hiE6iGwBaa5+qRFly3cf0Cn6hDMgpHJ7bmsQxrbAmbYFcpBa2C8qVQFlcUh8PSa5F6RSIvt
 O/Gljw1TQiWRsZrJpNRHBdZyz6pVBvM=
X-Proofpoint-GUID: XjgVB-rNSbUNXcNMO1X6zUSAos_t_wxh
X-Proofpoint-ORIG-GUID: XjgVB-rNSbUNXcNMO1X6zUSAos_t_wxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfX0VnB5XZ2aGTv
 o/rnVzUIgViR/TVmDDBrJ46RZTDAhQjYJe5hv8srYiold6vrOfYy0ioshp+nUYskP0gaJ9qFeep
 QZD/caJEq89MrxhbfOA9CpkCkVDETaL5VrOTYW6NcZRot4Y5bXhM3vhkpXelnnJNxsfMR6yORA9
 YSxBWYjdHn4MaDrQJM4dhkyZWFn5bgfLpARRjitm1QxdD6ViNLpVzsvn8GirRgzBccEDNOF+6EA
 D/fnHbJLzJZpIKv8C8zDAbEg2RUQ+jT352GiDiKSh/skQUndC2bgeLPR+dWXNe37FJnyHsFXsoN
 iZ+nw8JrcRYDt2qxFhRH1UJqBnaZgN0TVwwksYaqFdU2uaH+aP2ezFTcnbQnz2Ts7DaSFId8YmM
 Nmg9T2LkX/xPoaMfUhT8O4kKJAYm/WYNVTbFuK0oceXApSNiPzJPnCtNoLwEpkWGIdnshWijTzk
 PwOmzrmttu/NRr2BbFg==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af494c5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=d7ooX_hxsFC440dZs5wA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_081606_932676_A4023EC0 
X-CRM114-Status: GOOD (  16.36  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The /memory node has no unit address. The dtschema root node schema
does not allow a bare "memory" node, and dtc warns about the missing
unit name with W=1:

  qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
    node has a reg or ranges property, but no unit name
  qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
    {'device_type': ['memory'], 'reg': [[0, 0]]}

The bootloader fills in both the base and the size of the memory node,
so keep the reg = <0x0 0x0> placeholder and name the node memory@0 to
match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
msm8226 and msm8974.

Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno SoC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
index 9b111525e12b..eb5c1f3630b9 100644
--- a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
@@ -86,7 +86,7 @@ scm {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		/* Bootloader will fill base and size */
 		reg = <0x0 0x0>;

---
base-commit: ae2005cea2e4f84692268e54199bb03f5c6f4558
change-id: 20261111-kuno-dts-memory-unit-addr-7f9fb954bb93

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>


