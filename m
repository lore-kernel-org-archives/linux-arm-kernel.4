Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177D7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2VXT9O4S;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dFRCaNK/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EWASC6Wa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=; b=2VXT9O4S7+Xs57
	EDc+ATQNxNuh20r3RYAnh0ORB8uegOz0MAg78JgxwOjNrVSJYZ8eYEBnnRCmshdkd5jyRYAAB9Drv
	BrPYgMe6daumOzgRGctGxF/G+qJwrKAcp1U7uXjNYudYsY/Fpk3/xhOXQU236sPHMyPp/zO7Sq7Sr
	MjBGSk5zq+QobWbDb7+zqlpc7+WhI+mTUU0uMQBou3GhTyTO+fefpDzqrTY7hfabqfBCqo7+bNuQ5
	1vRDx2QdJojPrMLc5ZKv3OSd2jh6BnCXV7Lgoo4icAHtm4yZMRHJl/N+zMo0CeKN2TrkIuG0rRUZt
	2PKs9hkwmfLIXNNS/n2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrfh-0000000FJoH-2KFa;
	Fri, 27 Nov 2026 08:51:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrea-0000000FJHB-3RTB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:50:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gbkt3983833
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=; b=dFRCaNK/4p7+RnyJ
	Y47wepn4POLlkF1UD1qcJga1XDFTk3yAIKtxnEE6BeqraJQOBrLNcIhfid0FyyNV
	r1/7K2DFVuLPxgqhTF1xp9lhmk9CIrmhforMtEgGaVz8yaejnQMdNoEZm7q5ksAB
	n4vCwAJtOgBp0X1kb1OQmO9xmThCEQpKaGXo0vN4xEQDrtCENvGhs7i4eLcNQbof
	lx34LDhTSVahbEKxcDpsDIT7gAuUqlaawndHezehJPEUzUqyfUolDh57t3+DuMqG
	CtNH/JbvJNzKXu1ov2ltLVmrkqPrKzZUbu7gS346l+yt/TaIeUIpX0iOsn1YPTL6
	eFzaQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:50:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb53f8aab8so257729a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769399; x=1796374199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=EWASC6Wa1bnQwbVQJq50E9/qE+CIJXtTw8Wpafq2KDbf0mYtd5OKbFf34UiChHD9er
         xLS03R6+1IGlKtkmr/v5jhmzXMK5bbz7KRPEh62+Uk7BBNXAujo0twqBo7kgDU6dwX64
         CXLY1FAw92LLMqRDVjonJ0Ffk8QnRRU+syhdlcjnfJkQaF1+8+HoRpE7NElPtNA46BZV
         EitLQTS+Dkm4dq+i5+DVRBlgLshnNRZcSae23teI/21y1N+0p6hxmDfMUEY9OdZh4UU/
         nQrHYombrWrfaexsHfx6GYry75OmWtn6zamDkU/foFO9oeXXw/6MZQ8HKGxZVxpmVkBz
         w4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769399; x=1796374199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=MtDh2ILKZcpR6AIqAoc7w6diyplFsYIL+6j+eCI7jrmaxjpu6nRQ7YASG0gpyilxEC
         zPbw3Ywf7NyED0lgXeCPjsoqi7XtamgZzw/V2Ir/1pLB7vDLP+EuU5Ka4biUrQDqc9we
         EJB49jFVbrRr196oFnvuArk1CqIztUM0b9Q4UqgIaynA/vWyx4eNvn1kUlSw/PH+VKzc
         kYS8WGK4WZ4XP4kfvdMT/rEpeW8NWeAeQhmmFsOHhRFcjB/lnCLrNNfpk2y5vI88myit
         bx8fH12N4RiWi8GBklpmK8wnbYVpBSJiamcYUj/kdQ8n8rEhCokAnR9NujU+S0BA2OLX
         wJxQ==
X-Forwarded-Encrypted: i=1; AL+hErFgr4blrg7PSsSCWyxF6gTIkQdQyArkEzDy3YKyT5NWQxvvgV7V5kzUycmFV1II8fRdcitkeZxALa7usi510Xki@lists.infradead.org
X-Gm-Message-State: APuU4Z+/A26oParuy8VOrUPaTIJbRbOp6ABl2kVPkUEWRYBP5bqjCyOV
	tfwlexG1RQOpR5xlwO58U+gekjyx7k6l5EmKbwEL51gsr5jbFpwjhLFlHxpj6tgIea3CWdfsEBh
	ecAcxpLlEOKBbK2kGDRTBEOIMF18OWFqOsmtrEIvFbSzFwcvvA1gKZbiZIDauSs+FkNBcZTRKol
	aWqQ==
X-Gm-Gg: AZFdTZeuM8tv7g/An9SWzDI7ubgGk4OeeLKXLTkZR1IasLlXqKcCAA5KqPtD85Fe0XW
	UuBL9zRGPlsPdzwxBW1nhfd2CPociuCN94eta/2NAcFT8B0buboRthV1s9KY6Cr0ECba+wwhS3F
	bRV7oRZAYAlPk9TyPJdh0+4SgK2fvDLa4/px91g1jMvHk10mYYYx6zcCixUVxArAaz7JN9FLIze
	cXD/yGB8RUu7B0d/sYf43jnYpSxjQhwQxph3zDwVcFDp+NMVFiCAvuwNJ6vgY3U1B82JMwFW3m0
	FcvxBjyXJZ0Drz5l/U7hRTEZGPgYmdJcpK2OPglTBI003/UQAtJKeDWFmw9ah05O0mdWwq/Jz/z
	DdFcLV0ZqrwU62MEaF9ZIZuZ8bi76HbiWPxIaQRfleiKFPMcIMF6GsD0Ws01gIAT5qhxDLuUlwe
	6/32VobHG8C/mmksi9NSC8OWz5u3Cl/4FrR/2Rw14IndmRKyX9Km5Mn995VkMrWQxpFn0gOwT95
	0sXH9Vy2At1+xxxjrUs3yY46oA/FQ==
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294695ad.3.1795769399474;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294345ad.3.1795769399034;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:58 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:26 +0530
Subject: [PATCH 4/7] leds: qcom-lpg: Add PM7550 PWM compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-eliza_disp_all-v1-4-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=1089;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=tkx+9mrW5AZ+HOy6XzHglysRWK78jQma1MhEIAFTTJo=;
 b=8s59DlyRSZewARMpmXDeN0BjCap++JIQsz8Fj8QZAwu5z52tfIwwDwzARFsRver9MLXktwHAL
 GkoYA3WNzQmBx2LBkykLEnVO14r488O89BTrGA8krDwxPGxcenNWjyk
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: E9lmlH5jDKTeo-ia6VnUae8sJ4EnM0rW
X-Proofpoint-ORIG-GUID: E9lmlH5jDKTeo-ia6VnUae8sJ4EnM0rW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX8iqOeHaaVUYw
 id62NiLynaUP4zjewxW/XkPx8uqpd2OmEPuBPdi3sFBp81SUDTi9c/AN4hsowh/wTwzur2u3pRQ
 +0ZugUwrDUl/L6Ul5rlaI0s8Juwmp2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX4c8WW+GOz93p
 ChgIx9ZzooatrOopmrCwtK8QCAiSllbz5JjCczZpsVGoeobwNFu3oaoKM6XcGyZKIFZj4yCleDY
 gkzJB6LZZJCV/BfQOwVM2nDr/9RZHk5lWDS8I635eEqm69W17K0c/WwjoxDp5zuV4UVG6ZMLPOG
 gwylsj56OfTL29gPc0/27GBfZjAG4xwGIWk6XZNNH4fqqZfV7aQXF395xDFfQurZJ3h7IaKNPey
 VXYCIbZOGd62mztU8iudfPbyTym7kWNZfRwFnvvjS59v2yoHHUghwe7maZBv0GuzylsaR+gbDju
 COnzO7koW0vaM5l1qMSvz11VeknBFd+C/6nxIgD1SdWLqoplCpINqadGE/5MGESP5b18lmsHK0l
 9E2QKDiunRqqtfURNL4XPiX2PZQ1tfe177wrzlVaW0uNolxK6B+FGVbhnOamWjp+UDxz9+c0bBQ
 a9kzUDmD9SDw1qDq72g==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b094438 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8FmHkYH7MGniFFCvUCUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_005000_893809_B45F46DB 
X-CRM114-Status: GOOD (  13.06  )
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

PM7550 provides an LPG block compatible with the PM8350C PWM programming
model.

Add the PM7550 PWM compatible to the LPG OF match table and reuse the
existing PM8350C PWM data.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 98e39e03b9a1..6c9cbc75bbfb 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1827,6 +1827,7 @@ static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pm660l-lpg", .data = &pm660l_lpg_data },
 	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
 	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
+	{ .compatible = "qcom,pm7550-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
 	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },

-- 
2.34.1


