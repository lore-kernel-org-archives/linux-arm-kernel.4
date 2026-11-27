Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B5606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wL4+RfcJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pDA8Nk+r;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3KkDh8K;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGsQWKno
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=; b=wL4+RfcJ0A/+T8
	C/8v4mUC0LrA9IPwVVfBjJZRsUrLI7MaxwqQNSLhjXRCDX8af63h9iJzZjBSeWlL4LBfeyT+lU6Rt
	ndM8pcrbVjC5xoo+dzJ6GFXWoUOoBE64XYHxR6e7B5OFDVLMm8UOp4WbOU/HmE+PVDyIZ5dWy5dqY
	EATpR8WI8Kzmc8mCtTEB0Z0ifDg8iagCMy8XF0+rLdaSO8VlLpb91rRBoKOWZxH2zNhlKfM4ckzfj
	ZzyI+JVC0t0IT2LhFs+EMdY2f0bfaYm6eErPRVr0SMXdMs5pb4l5j1JjlR2dXq6TjB5/G5Zh5AwPe
	OA3DAN5rHQiuNUtf2xiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWres-0000000FJRA-2XiC;
	Fri, 27 Nov 2026 08:50:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWreY-0000000FJGM-3yew
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 08:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=; b=pDA8Nk+r52a6l1WMsg1E/2iirL
	1lvPI9reO1MibSkI4WDaXeA51nKDi/P4H8Hm+/cLiAnril0ghEPd0aQ1yWUA8sng7SI3+83umlcx4
	F2xyoyFBhJ0rqg9QGJCtQPRkILzxPubMZcBEoSLyCNTxQX1ycYfa91xAPepvyZaveLPZRSXv5J0IE
	yhgKm2w1HA0pZFuRPxDwYSleWjnaL7b3GvU2YZKlhoQneuGlwKfyH5Z1Qf/ET/9wZh4xjZLWadUiX
	lQiMW7Lcp/RLzFEFPB3izydO+UXQsVqe7c7z74DPHXx7s0VaY50BeZDOvYuryuRvf/17ak6pSr116
	DY0pl+HA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWreV-00000007TRL-2wrE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:49:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gr31560538
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=; b=E3KkDh8Kv8+fEIH+
	UCG+LFrtxkEQWCdVW1J64XarWIJvApM+yo7SEzI/Bh7VE97IsIu9BZ59bu9t/xlg
	pnw/Tl0b1U/07AR175T1RkPCuPf/6Tx3Ob7lGb9yHQkXrE9/W7UIu5ZhwFJKVDbk
	0jwjdJyvPGz05/GtQnBYItYBHimZjhlnwvP1Z8ZVu2DL14Loef90v+aaeZKLr7Xj
	E6ztXA4KML253nuH3RgcyC0dGgTwWEsxrjaz3h04OoB1Oz536Te0LmTuYoTWJBA8
	l/dxONWQ+7bBXyGAlqNTvhDrRpQ+UUr0vYZ//PqDXEmpCYZKJh2iVHjCs9TvMWxl
	T+UmMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk3a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:49:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f01caa8ab9so9326065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769393; x=1796374193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=kGsQWKnoc8dHs94DQpcfv0MDehF6BdkANh3MznUEDHDsCRK/Qfc8VB+jpWJFbfW/IU
         Afj9EzjO05+yNqs+9Cte6aGfmSfJs2nptDRrtzCNf2gjgYxBpbOdScCxKiKEZmTqY6po
         FG8Egk2WlYNGSzbCeIYlfkIOhZDb7zYHkM83o1Jm5zyRq8SBcQNfkq5nQ3W/XSTfkFyO
         n4zQqhhHmKvCTS7wx5s0wo2m+BgJfAWd0RtOBLfKiCFF4SH0N7f7Chz1Tom/NHRzBG02
         88F+xGE2eGLuUK0SoRVy0t/fGOmY3P+eWxUOEcsCIyG706LjXG3hO+XhR88XoY2JCq8Q
         Njhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769393; x=1796374193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=zPPekybwirac3r3uRvDg50fSWqlNJ7oyw7eVxb04o3DYX/WIz3hL24p2FSyvI041Vn
         5508mjX9YtAS4tEGnPmIq2F6vfY39ulZlZSGPVr9GV2KN8KautGBPO9G0re7nlNqKNoy
         riSXZtLZTNiDYX59K3daeVU0RJhvmcqsfeQGKjWXNAlDbT+gTP/a121p7DXZ9cozlwNP
         c1RWOV2nxvr/tT8NBW5Ub563nTkOOC7Ookh+a7OnMoy7DfaEKLOGx7AT5oKgSjAhvlqQ
         cSFXUOoWh30iCSYifWQUFogsqFF5ETR1jIQhFe3EvyY0Q4GwOE8Cz0Ih2fzJr0kM3a0Q
         G5sw==
X-Forwarded-Encrypted: i=1; AL+hErG7Icy2xKUAWxPK1g632vRUd2lCXUyiUNBhIX/ZLC255M2Rrbvn+TkpzBFDjvBM0zQ7z4pLCiuUgxFOlI4Fybqi@lists.infradead.org
X-Gm-Message-State: APuU4Z8YYTPShLkDpN+NOJeTAj3bjLERf4OtqY6Rs1+F1b9kG2CwxzmM
	PgFx3ty/lbi/BswOZtr0lPQ+/qdxS6FT6+ylYpuEXGv+VSBb5/b6RntjZz6Mnnr9V0tl4rGf2oN
	0nvKT5m3t7addiz/cF8lwZtYT3HjkGI8qabFSVbN2TlWIZodQiu+/Oj9LB7i/hYZB2ol2z6K4q6
	Wqyg==
X-Gm-Gg: AZFdTZfJnYCte4tMQjIP72ff1XYgre728kViV2+CzvANFiqCDuvth489zZu80yYMZeP
	HADZGAXlJja+aBWLoJHwvsPP3fs7ZgVnsL+Gv6FbiSmiiDGGJNm9klL9vGH302gYj4h+28HkxlY
	+iJpeC4p0UMH7msEQxIbq1ZetJ7OGpNGQlfoNgJHDb3a1JeMGM3Zz7c0aHM9JkJAwQEP9uFI4cX
	0SnMI8w3z8CyyW/hFBTYyVeVytJzJ8oRygNZ3w6KS50PiqYjgq2pwSrXAV8HBwV0ijDazEK4RZ/
	hgG6Py7yRySDW//Zmx5cTRncx3b1TxP0cAqXbzBMPgS8/C9J2g8SfHxqz41S/f2aG+ItHPeBM8j
	Gu+IuBJ4Hn3o7xT/t/y9R6vq4ry7K7iSs+TheJiqzxOyw5TLSE6mGArXZfuS54Ffcvb5eHmSUOF
	E1ITpug6VKqyQ93Yatlazr5sd+UzBMGyH9vYvTt98mx6eI/AmbIZveNgo73cBJoU86uIVHx9v37
	GRMJW7z5bDkmSS3XOBrLbBCXO+49A==
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538475ad.0.1795769393096;
        Fri, 27 Nov 2026 00:49:53 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538175ad.0.1795769392692;
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:25 +0530
Subject: [PATCH 3/7] dt-bindings: leds: qcom-lpg: Add PM7550 PWM compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-eliza_disp_all-v1-3-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=968;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=td6QK7QkN9RdMGuNpRMBkvBsbxEVpka2RCJEN8QUWSE=;
 b=nqIn1yBnMRkPS85K1WKxZXXJYyHpSwtecI770QSW4rbu2xlg02bRk6lSpqsyDLejO1ZElnfZp
 PoRcejJxhjVBerkKVpJWrllXzJQlVNSK+T8iWspoPucUjkmijwcm4J7
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 5DWvA9EAP05OyHjvZawIgA6Ak05QMo2r
X-Proofpoint-ORIG-GUID: 5DWvA9EAP05OyHjvZawIgA6Ak05QMo2r
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b094431 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0GMz1rgL7QW-eojhWosA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX8jx1vHkscW9v
 YlEk8126Vs4Nqy0ID1gwY37o4x00o7ywJqZNRpQO9x2A5v7UlODMHUfA/cA0+N8oH+MVx+i3RSR
 iskDIYZytcso4JPFzmyEzyA4P9w4jeY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX+6gTVwRjFk9s
 xjJ1kzimvjG0AtQmLU9OT5aT85C6r0CgD/oJDLC2BZEpFnoxFvcmn6sygfVrcgRHbUkYDXTMTSW
 C45GoQElcm9+wsUDgBIhC9rrIDpZzD3YccL2MqnqoCD7bH463mNLDv8CLaH+e6xr9oNka1vsS2Q
 DNWfRg/9A/Swp6DMaIBh09/acepjgwYgr3UlwGw35yQNCTbzuVm586krDWgtkzho+tkQwC3s+m4
 A7023c1ECMIXmOlmfaC5rH01XmJU3LbJkrRTD/A8hz3gjs7g6G5PJnPGFa6oKj4a4LOQIVOEUmM
 CEhjMi4FzeIJOBYyt23E1ZJOWtwaioh/+zFQIO2fvAXfU+RROY5iblOV12oZcCEm0ZeWo3OYokE
 P2LDmv1afMv//1xUTpu6e4gAWSVqy3lfeVt8hSY2QHQHdsmJMyvpoaXKg2MJ7YHMIBoE2Pocg4T
 UJeJFO2Ke28E/L/PrsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_084956_458741_5A856C57 
X-CRM114-Status: GOOD (  13.47  )
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

PM7550 provides an LPG block that can be used as a PWM controller for
display backlight control on Qualcomm Eliza EVK boards.

Add the PM7550 PWM compatible with the PM8350C PWM fallback so board DTs
can describe the controller.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..cf2c78f7f6c5 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -42,6 +42,7 @@ properties:
           - const: qcom,pm8150l-lpg
       - items:
           - enum:
+              - qcom,pm7550-pwm
               - qcom,pm8550-pwm
               - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm

-- 
2.34.1


