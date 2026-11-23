Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FC0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BQgzNMd6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzqhkUp9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IH3i7yHA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=svF14fRerx1BSkQmBrzjUcfz3cY+DPEYvRHCJyqzfP0=; b=BQgzNMd6S+zH1yL87KE6EoF8g9
	9+GccdB9IRSyjoHBZZefyNRHGqOL/wY8CMtAU/rQEjRX05fdLXWN68HvU8w3olvti/8HwH4EMrpPQ
	+G4aPL3yVixf/FKdfz/MfsX6dtZH9BKewNtEhBOIqA+0MBzbYoQBSWOvDZADPiHMkaz8Sn8KRpRhX
	MUx0sUH7SCmKm9cP0nQLLxJozKc+HE7zosn/OTRn0v7pCUhGuUffE2yH7U+1GWc7YSqTxLWVtS60c
	vfzjJpM084mtrp5Bp41lxFvyu75PtJCRebigZ7XIicaPB8QA/E0xuS0pWdGvWzR3FBTKfN0g7tSyJ
	5AFIgCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzy-00000004X6b-3Ai0;
	Mon, 23 Nov 2026 18:42:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzO-00000004WYb-40tp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:42:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH68r1093937
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 18:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=svF14fRerx1BSkQmBrzjUc
	fz3cY+DPEYvRHCJyqzfP0=; b=XzqhkUp9yxvizDH9n4WZ3/0ohqJSDyqGA8tknN
	3zLIxR5uhk8TsBb3hF77CAM8Ld/BYuYiKQnXLU2cO+xeYSq//UZdKIsz3KAiQaLh
	Zf4rsbP4yV3AuqtdJXtY07lhuLom/TZ8L+BINN+n0EFAeYsNvYvyNOTxIORHUW67
	sPbG6URbRRUNDzRCGrxXXIle99ORpnNgVMqW7QSIRGf+Gqtux2sEn8ZrCoKi7Hf6
	Ho7JbPweu4e09XLawQjH85jwWSpUz9JhqtXPDJ9LUxCWcYhhrpOOW5nTMaXrNDd0
	tiRVYp90f55m00LeBy+1bHc4C+t/yfU9rqKM1N7O4GoSp09Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0susm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 18:42:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0467a525eso26772785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 10:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459326; x=1796064126; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=svF14fRerx1BSkQmBrzjUcfz3cY+DPEYvRHCJyqzfP0=;
        b=IH3i7yHAjASAkP0WnVfcIXHdIE/6S/iA9ebJHj7hJTZpC+Q0bOMU3neCvMFNlcHN5K
         seYL6cMZ8en5UQpr8zlar6ldY3hFbMnoTLWZfDU0XBL25jJDbTTHyigQT+dy/zgR3xv1
         LyjrvO8g6k/7B6iH8KM1FD5mPkOUHFbTUqnR3Ngd7jeXAtYGpiUw4OY832+MxEL4aapT
         ScJqdqad7eMKuHt/NyowHDCjf3Yo31UZqeJgZ/5FgKnWMKo137fjfRRJyFPugDXMbLBB
         iffqu9SvdaNctYJr0SrG0FKwbJ2hWArO1Gg+ynk+j6e6WzcBBcXAuKEwcGfi6qLI9zI8
         iHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459326; x=1796064126;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=svF14fRerx1BSkQmBrzjUcfz3cY+DPEYvRHCJyqzfP0=;
        b=C8AAFlLEjx2q7gNdiTb6dLYTMjSMpu/OIzOhWCUT7XKAILoyMRLlCD5mt0UjDPOwFN
         tAWYYhWaOAEX2+ZxSWzPG4mADtlLjvlHUs6DTuYJJUgMIPEnkJxh0r+urPXA+i9dY+8f
         P7o1c4Ol3Tdg4EuY07x8plkZuG5QKwbdXEA3o5gTjQ1LKBy7hAR7yxVCxvER5E0wjzJf
         aL5MnAD+zfo37PkthB8PFiFtsVgH2Bt0Hj0BXWSz8tXMjU8zD1CRp63yJOiXB9kZ6YNH
         4bpRPv+bdjXym8pfpMW+FSzjmytXkiC31JJmSWN6+iCep5tlDGT1wYlWCuGo/zBYXddV
         s5QQ==
X-Forwarded-Encrypted: i=1; AL+hErGxuiMVEzCE55kC3SAzX59CHf61Ozy4Bt5/nLxUXWyjq59D6MG2ZKRFTQoO8gQ7XOs1ChvXmG16bmuROPM4FuBF@lists.infradead.org
X-Gm-Message-State: APuU4Z94m3U56KCv0NIcq02OLEURszkBTftJNHcZcyZHyEgm9GaSV+hX
	uLMVYg0YhTkFvel1CKcLWwJsx78r/kO8B5fZdyEUNZOc9iWkNJZ9s6n8QlXpkGS3WoPCjJiciga
	8+Ism/3CHlHKypzj/x+e/Mc9qyGRCj677tMHP9SrPT99BANaFn4A+d9bpc6AEhAqVJpAKF5LVTu
	nzI+7FNhLvRg==
X-Gm-Gg: AZFdTZfdlyr6x39X8l93wVDM/Xi5zrvvV8kmjU0aR16Ug9xTrJA4eHUrmV+dk2dr3Y/
	IQFquIYmHg+Uve0pcwcCyYYZe+lGGb0K4E9mm397VllkMv5HjDBqHd5Oe4zvXIqGYkzbGB0Di4o
	cLWo5ET3Bt/uP8HlLyMrUyay3uOw+7a1zmnE3BpM50c+Gbfj3m6eqq7mzsUo5xpbMaUtxIej81/
	Lj2bURL5mu15MAldW5DHLIx8W7k+7YsBg1DQ0J1u1RqWqYFqsogeSW1FvQwM2C5YG9EUZjQHpfM
	sEGRsX+WTA1N8YdnI6df+vbZdxLeB6RHA4CtXav4qnAx+wBsm2o2r+S5v6wuYcoCENlLg34ecqb
	fY+O76GRulz/YW6PEwVN/ClYu/SFUzCj9clm7dxjK9x6+8cw4+13S7ZeOovcdDcfvPk1ECz9oN+
	RlDZw=
X-Received: by 2002:a17:902:ef4e:b0:2f0:4ebf:84e5 with SMTP id d9443c01a7336-2f04ebf8708mr112150835ad.45.1795459325417;
        Mon, 23 Nov 2026 10:42:05 -0800 (PST)
X-Received: by 2002:a17:902:ef4e:b0:2f0:4ebf:84e5 with SMTP id d9443c01a7336-2f04ebf8708mr112150575ad.45.1795459324872;
        Mon, 23 Nov 2026 10:42:04 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm57984705ad.55.2026.11.23.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:42:04 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH RFC net-next 0/2] net: stmmac: qcom-ethqos: add support for
 RMII
Date: Tue, 24 Nov 2026 00:11:44 +0530
Message-Id: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOiIBGsC/yWMwQrCMBAFfyXs2YDZlmK9Cn6A1yKi8cWuYFqzU
 Qql/27U4zDMzKRIAqWtmSnhLSpDLOBWhnx/jjdYuRYmXnPjHFcWuX8OekoPERtabv2mDlyjoVK
 MCUGm362jw35nIrKNmDId/1Zflzt8/g5pWT5JJwbmfQAAAA==
X-Change-ID: 20261123-ethqos_rmii-f929c84f24e6
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459319; l=3039;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=Eozd2XBF6qkMrOFBsjC0iY8JAZG6nfTTy3vV5qFG3G8=;
 b=1/sjeU+R6y4z4oLE/0FhsjtnLl2ubfL0fg/7N75Gszao/o/5Kx4DkrG5BCFQt7g7t4ZIhOFHM
 KS/LQkOhiIWDPSFTNC1ObzAVDYpjjA11n/qet3vUye1jWdoYd+H/0Ib
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: emLGhpeceTWC5gi5C9X0H7kmEJcNBxuJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfXzr69/ERaL1KL
 31k6fl8HdrKlzwnNNArUN1/yRUxvLbl+TK8/CVpFz97gMFDJiIvuFz0ztQnC4ROGIy1Qqni9VR7
 T4miE+I3Ysr6EOA44s7c0Gai3oWaT9s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfXwWDlTygaj97R
 R43B4cL6Fcetr61M9DSqb3AluQogYUNpZCpdbsRXvsul5d4RqEBnmYGsh60NGDoY2jWwNYlLeOQ
 4n/JCv93awHuyRvv+9U8i1ForBNhgVxl24ZOMBldgP3dAb5tMHc87A+ZUFSj99yiCBMcv30ZtyB
 c4uLaI6ukC6B4SZ/Czw/Ep51OwT4AzzXzXPhVUXJPac3DFa31/YVv5A+9UJf4FaMkujbLni4kH9
 szMphCBWoalhYI8jfvn5uuo3LO/VVGd4faHGKXcGzmdNM9us2L1PwsnZ02yZh4ODH4nIjqeexdY
 z9Nu4PMyaqannwQkIeChA/m5FLWue8hIWDuGjTkwSpQCEC4aywjocc0dTJn5WIaodLk8kknximf
 dqfpN+sA07d91d1C1H/c61Rf5JRH805X06MlxSX2s8swtQypvwFUOAmvbEyxVtDlQvo5rBmhwqA
 lQ1NeaG2YoOwbmlOBCw==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b0488fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8b9GpE9nAAAA:8 a=EUspDBNiAAAA:8 a=fnaMMcORItm61ZtTJu4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: emLGhpeceTWC5gi5C9X0H7kmEJcNBxuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_104207_011633_C4665F1A 
X-CRM114-Status: GOOD (  20.95  )
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

Hi,

I am sending this RFC as I am looking for some feedback and inputs on
handling a HW quirk that affects the RMII PHY mode on the Qualcomm
ETHQOS controller. Maybe someone has seen similar behavior on other
platforms?

The Qualcomm ETHQOS core supports the RMII PHY mode, but only if you
ignore the dribble error, which is set in each receive descriptor. The
programming guide provides some details on why this happens, and an
excerpt is included below [0].

I initially thought about using a platform specific flag that would
ensure that the dribble error would only be ignored for the qcom-ethqos
+ "rmii" combination. But some digging pointed out the commit below,
which does something similar for norm_desc.c and enh_desc.c:

  commit 1cc5a735185a963ed9324a65e1f2db02bf52c0d4
  Author: Giuseppe CAVALLARO <peppe.cavallaro@st.com>
  Date:   Wed Feb 15 00:10:37 2012 +0000

  stmmac: do not discard frame on dribbling bit assert

  If this bit is set and the CRC error is reset, then the packet is
  valid. Only report this as stat info.

Apart from this, the wording in 802.3 around "Integer Number of Octets
in Frame" and "aAlignmentErrors" specifically calls out packets as
being error packets only if they do not pass the FCS check, although I
might be missing something here.

Anyway, this series has two patches - the first adds logic to accept
receive frames if the dribble error bit is the only error bit set in
the descriptors, and the second adds RMII support to the qcom-ethqos
driver. It has been tested with the KSZ8081RNB PHY attached to a Shikra
SoC based board. Since the programming guide mentions a generic
programming sequence for all SoCs, I have kept the platform glue logic
generic.

[0] Here's the excerpt from the ETHQOS programming guide (paraphrased
and shortened):
In RMII 10/100 receive mode, differences between the PHY's recovered
clock and the local reference clock can leave data temporarily buffered.
Consequently, CRS_DV may transition at a nibble boundary near the end of
a frame.

To handle this, software must ignore the dribble indication, RDES3[19],
while processing RMII receive write-back descriptors. The dribble
indication may contribute to the descriptor error summary even though
the complete octets and FCS are valid. Other receive errors remain
subject to normal validation and must not be masked.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (2):
      net: stmmac: dwmac4: accept dribble-only receive frames
      net: stmmac: qcom-ethqos: add RMII support

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 49 ++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h |  1 +
 3 files changed, 53 insertions(+), 1 deletion(-)
---
base-commit: 5a1f6793361524314b442371dc05ce3cd4f2f838
change-id: 20261123-ethqos_rmii-f929c84f24e6

Best regards,
--  
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


