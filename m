Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607360A2631
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rrkMd8bM;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6ZiGQf/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iNkTNjIT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=rrkMd8bMiBQSOI
	s0zvTCzmRByZo1jG+mjBQeIp4z35tHx/AsPxTcSvBxgWM2vvf35pogORpbtqPNAY3T+Zj9sVZoNGb
	cwHdDy5DDoHz87K25FdGIt08ZjvzmvFdGfJFdN67qYSPEL6LwZpGSVWghpABKCwxGJczRdi6MZ1Fs
	ypsCTUbmqRkUIBpod4tgtIzciWG81Sovh5v43WzUo9UYD+yTyRjXhF2nhBahtH9iwjwgys3QnlVtg
	Sm2p42iXsmRFjk6fRwoDlG1GN7T5i7P8es1qEJtksLaTolCOmUVz5wHYlai0DI/P2tJD3P2vXUn1B
	hwOU73Dr5jK59YU56zaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOte-0000000F7wA-2VN9;
	Fri, 20 Nov 2026 13:43:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtH-0000000F7bD-2zDf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6hi3987232
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=A6ZiGQf/QVWHmv7o
	LgLmcMQ6R3knvmGb13jNkA37r0ZEeWaan8DNF+zQ+gJ4rNPLDpE9I+aQxGawgK3V
	f1cd10G1EFFqtepllVHGXB69EQp/bSDCJFG2RyameJ2Zu1vk7wB5uu6Jz6at8vnd
	gE2PATx+RF7oV8PILaO2iDD4TIzdRfbd12OtzGs3JnyexMuOHQsWS2XBqwaiewgN
	FOUCLyf7a+LvaNV60LXsRxt5HW2Ps7uDijnszZqwMYHy6C6XPJhUuX+Hpyjcwg0n
	HrSC2BDo/QU3fNneX+LutL6URlmZoHVKSbiQRUxXZIbiPYypkm+7pUjV2YCDt9ls
	SU1rMw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81pv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1150515eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182178; x=1795786978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=iNkTNjITcTyAmgsBCjnsG76K2TltaWR8aylDP6XjYclJmm83eXQRmICInYLD8NKCc5
         DsvHBheGyKBlWL4scqC4irthuFL05VcdqT56N5Sck4lZ/yOMstIgQ6LM3eqKxPW6X1NU
         H4gDb/5xb0qL3myO9NxjybqZorG1qN9+ojbBT/BmFE5WTX7xXDPTf5TH+L4D831j2xAs
         CfbM+wzS7J38S1Qi+k2A2u6iJAx7jUFCCv0IKTCelr/roskdrLkE0qvHtDOewi//5hQB
         13TLU7CV2aq7gzP+Ns4G6BISbBaw89dqFzobnnqoIiUhy/hlLYT/LrbqyL1aexTAurXw
         rrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182178; x=1795786978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=oCqHQkfR/JLLypQuf5FTuxEwS9mkJWQvzzqqHU5f/IENz2XTwPe4M34+pHCOt/d+xc
         pJvRZ15GNEYhLG5bzyVM4gIfZPNh9QkIixuliwWixMtPrK26XaErBzuI4vLk1mW40JOO
         C89vRvo6w2zwxqn0B1xIpUTwbek3BAsCQQHqBFdxAAPzq3t0sUEvTJ5D6TTvMS1NxsYc
         dGrMh04nlLRzajJBRndPbBbpNh8od8pm/Y7tO8yJ2Fc5uutzVSqSQ/Qvi9fOb6qjDzBm
         3zTYzdXB8kmhVa8B1r1a+TQdHb3Thj/bX6xEGZ/p4mjbNrDq8jqqlZWZuMCZm1NiRvAf
         MdOA==
X-Gm-Message-State: APuU4Z/8jxZ8KIptO9kZL68K1gkSfs7vYBPiHIMern2Q/K6cZN7MvCxV
	EgzsvDExxDIgbQq2OzvoLGo8DcvZJxiKLC03X1TVfBtGaCYngHp2vFKwk1SSxnkPNUvLjkUDhQP
	p6WmMagvYCMyoKeQ3biL2Ygn5lka34yCMiOg80ZLrFFcKbj8jhss7LIfpQklaAtB0O6CEnpTe1/
	MlRQ==
X-Gm-Gg: AZFdTZdHTI/OCk//0CXAEfljb05njtX44NTc7CC4KJQ8LR8I/tGQ3msOCcENo4MpLdf
	sUp1pRmwaLPdf4fZzYiIa9yN8YWHt2MmV16elNcM8IVHnGd/NTJbuvK1lgY0ZkLQjdLMV1PSwCy
	Cf0WEvjCz2hJwHILJqzkppscQqsiD6oc2q+Ex1UYAcWVP2Tvp/WXm6azflPPSCdkMDbh//zuD+f
	+q1QDvo81FFfnu6vXeT/SSw9gg7KYb0OmbE7T8/uq8kGiBgp1iPt6felzSJ17QI4PVu+Jy2NOfL
	+xQU+91rKUQp9RtTukH6K9ckI0n5JaDEUp04GG3MV70ekK1hp2gBO/5uhJGNhMB4jgauiWxtZrx
	8KlBnjzKqKh7z72wnO7o8F/zvZTggCBFn6Egb/+DaWZ5VJDK0D3ISfZ+2ctjFAS4I2Ob5zvW2ux
	WAOUQ=
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr4024459eec.38.1795182178160;
        Fri, 20 Nov 2026 05:42:58 -0800 (PST)
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr4024409eec.38.1795182177476;
        Fri, 20 Nov 2026 05:42:57 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:57 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:37 +0530
Subject: [PATCH RESEND v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=7PKy0XlSNrGfUIky+MIq+A+DSi/A91nh6BKC8dJ00Ww=;
 b=Wadu/4wuZPZ1RMqU647U3aYS4S7L9vnM9xaouvrfnAAIXIZwIt/SZos6s1LhBZwMDeZqVucST
 7xgxfkv7LgTCl7Wr2EN1tW/hAh1HfiYl14p8mUp5extAyIym+swkb5c
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX0eyeTzS2pZsl
 7hsKtXRrUtNa1e2bL8MFH1Lb3+ZPqRdovXHSK6rdUu+XBWKeJTvkFGLjplYCN7isHymuxBAlYUn
 VpOsN1RxacfjR/Oiy2IpkumFzqDddycxAq/+5MG6xDW/O/W6NOClDaOq4z1KP/StxOmbn6cBSVW
 B6aZWJo5KWb+jAqhO5UkTmYCZS44EiQLThsRGBa5C1igQAj7DPICgrRhdtRO7Ia8ZsItECzTWwI
 DCqRPXvUzM/sHZh+5xdicBEgrdI0XBdC8Ad1e0+fPgFVrk+zqAwDnG+l2F6SXzfTcNc0iLiWgYA
 9l4RcMYH1uBNNoM1rZvFkKpz6SSSky28ulS65UE3a/XMBhkh8c6vzaBhgsiQvPaF3pUOPKDSfQc
 f4eecQGMHpIoZmbwmiPeag8ZJKmiz7sv7DMtvmbG1GoMOL3H83bi+TcF4Ydmjiz8Xf/tGm0kVKO
 CagbH52a5FZ9ZYQenpA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004e63 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: EaSNbjp72tzdBl3LKa6Sv5BqbesM_uB_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX4PpJI4Lh2bmn
 HDv8ECitwuEctXkT67/A9X3tiOcO+ARPGSdOdBNAaBY3Ez94OvhLttnHXl7hKVyk+0HVXvSfEsp
 hpz+J0PPQ3QOiU1y4fOEleS04pXNCt0=
X-Proofpoint-GUID: EaSNbjp72tzdBl3LKa6Sv5BqbesM_uB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054259_751692_F08CCB96 
X-CRM114-Status: GOOD (  11.82  )
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

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..f022a44ae5c8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2102,6 +2102,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1


