Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C39B606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LxncbJjD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLP2RjhF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OQiV7GNH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=; b=LxncbJjDizAFQu
	4m2O3TtmldW0Of8b5rjEo+LjwFwsxNfBehC8hOkakSAu/IsxYuDwTWbENY+Xt+FLn5cH9qKlp8oJP
	4Tx2Arv84TlTus5mE079WSrMcNZ70wUW1/3b3tFA+lJmt7NBPfO8zwdh8RWFhiHGCLwi14kVDIHEx
	MTnyxgjBKgHEyXaUGOcpbq7/tZ0dBI0imZ4zHrXGqN9lvOT1TSK8Y4NWx16YQwWGcrsezQpsbaU2j
	R688YpoQ9TcnnvEJLa2lGTVEu4pWaHx2EgBAyHK3Zj3uVi2DNsgo3gDbgQJwT3oU+oifl8ebUtATn
	JOK6oWjWx9Fx0MCtUjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYi-000000023y5-43Gs;
	Tue, 10 Nov 2026 01:22:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYf-000000023vu-2iZ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:21:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j1Xi1803406
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=; b=FLP2RjhFF494uNys
	/SnHSHvLQddMnFXQ+1EPk8Z50Mpoi9+oovE3PIyYqip8f1U0yU3E6xa7kOwZea20
	Y1IIxjJs2XFQ8Sc7PHKg4Zys58YcFf47670+/HhHc5oVQIwct9Bn5tEKN0jWIfZl
	wyEsoSDXAE//vQ8ShkMJ2oUIIuwLHWfykgtXqqXufimC5eSK5j8pKS1qCtZghous
	0aIM8uVwS8hZ1T5k/+7vClDOEobXDYfdhy6Ox3tccKUYZh0htLhDYGi7y1UezDdx
	k1hCFGYG1hPi0a3SxPpaJGaM3hoBmyp4wkV9tV5Fhs/8WZJ5A9gVtPpnFLItKelQ
	TcVkoA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapb0b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:21:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eced5a4cb9so14806585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273716; x=1794878516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=;
        b=OQiV7GNHYxidxT8d+OGhRq2PVwt1zhKpWGrcfoLOWSdPhdDy98b8nB6QUa/e1fmb9o
         IfSzgHYOryf9YTZ+rHbX7s+4+XHlojEEY364Rwuhy02DqZilCj6j0sA5ygU2Eom6Nydz
         oUinLvht5U75R2OCivaKLui1IjL4nq242H2luuNa5BK89cUwIKpz+FqqJAfIKrjqhWrk
         +DV+1fnl6FlX9KH2WYtsb8+YmAIb11xgSqTo/9qT9fVfAPFuTbk8yXSGBa0MxsJsh4L9
         m6HpkeggWi4McF3aWvU8dLU7nmsrIT3IyocxeXYi+5v7nCEWMK+p+uJV4922DTTODYcH
         RXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273716; x=1794878516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=;
        b=FelkBcl8T8cipc9QeRaDXXoHkvrUbPw0YzpsRHcj2qc64BO85g1jdzGbe2hs0mwz9R
         92kkT9IXC71Zco4YZHds5GZHEZsywARrclRSwkWzLx6O69mFrx2d1SDQ5OxgFy+i/tfq
         63+O3opyJkX8qSoSfdDjmW5Kh9Z4aQG+DcVvDAGMH2hM3Ei5ta6WmCJEsDx4edO/dPNe
         tckPKxnfx1eFdXeMzlnutJ8P6uqlqwoBjcJfYWPhNkbfz8UFaOPrUFK09vVwcJsJHheV
         yaplsdPKVGLx41Bt7ksvm0orVAN6YOpHfDU8sLb6UX4J6j9VMuM3EB3DcZm6zp4RTtW7
         Nerg==
X-Forwarded-Encrypted: i=1; AL+hErH5slvE11X/FW3Lh/ier7rLcHZ74nwqrdpFOf8ilKOaa7LzD8VGUAmjR6Rf5mE8IomTlot/A7ayXB0k3adTmiVc@lists.infradead.org
X-Gm-Message-State: APuU4Z/cwZ68Dijm2bBOmvtQyoSFsHWDEqcyyLr7bJ+x3XteDCo4Uo8I
	gZIMvpcwZzaLPIMMB4DaTfwpddfD1IaHWoyjH3oO+7QzlbsOUxblkM34CK/r7CQ1iqEB3owjJqu
	WbQ+dAKV/o86AATJ+Nv1ku/qapohFu5yIZ6iwTrZDw93O7viczYxLVeXAUIpW6UblWju9TpNDDY
	zk0Q==
X-Gm-Gg: AYBFou0LxnkGxNPVBcdei9Aya7cWz5tnY4VZPlDwiXwRkkHpeyNfzCVTU7HvANXTUVo
	WSdu+nzmDDya+BPkre6+Ukp0JbC02N+ab+cc/mjJAjhVhrRqCTqezEYENOyySdutoC+mX4LMWKj
	yDr3rrLUhnqD91V/HvqOZb7ezOMfNZcSTjLmig/tdQDSlqx8gqHHVHk8HiR35zg8NKKChvANaTA
	uNs6xsYKrzwJi4c6efgnPCvGmdlzFjlsRfCxhXdGrgF8wnK2f/JxIY4mJKAnpVFy2r7HOSsYqfi
	R8fP/xgV2lUSdm/1RbJqeutf9Krv5YIcUeZPm6lBBNhfrDaPxBgLuw143j7kw16CDtxMJq4ttdx
	/goyQv9aYbT0nH3MbSX5DhXX70xCjYNfHfkV28VZ20A9qH4pxHQS/+8/ObSLmXXzPe5PhDTPQPA
	uChiR6bsnQcfx/xOollsvM3aX4Fbz1wC2KtHA=
X-Received: by 2002:a17:903:2350:b0:2ed:2176:2455 with SMTP id d9443c01a7336-2edb92027c9mr8718905ad.38.1794273716033;
        Mon, 09 Nov 2026 17:21:56 -0800 (PST)
X-Received: by 2002:a17:903:2350:b0:2ed:2176:2455 with SMTP id d9443c01a7336-2edb92027c9mr8718785ad.38.1794273715605;
        Mon, 09 Nov 2026 17:21:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:55 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:16 +0800
Subject: [PATCH v7 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the
 platform bus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-3-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1695;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=e/VC4qEgu082rNQ9Rv5+87S6VUZB333iuAfgirzakG8=;
 b=sm+yNpYvjBZ286lnnvRQiD3nOrJzYp7GbSRJ7p4Rm2cr7rwt/kNMtAoD0o37S0+cCRxGJ9+S8
 SI2iKn7wv/iAsCnbhvHT4fUeGESSmnxyk2yAjomX7n7GjuQHatL/B4b
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX8rfHp0aMbc5Y
 Fk2x4Kx0ULLWHY+OS60YfTadP2+SamwzRQe7bTTeyplb4lyWS8STn69B0OOUfHcot+F+MRdcITx
 lX2MiYAMZQjqdwzW9os3qqMfdyAVn3HI3fpncwwXJqRZSCLBIG/wieR5pOVCxwgBDzPbivcDAeK
 HfP1nEF1oW3ZJKp43H7+mO4ZCeHMcIa1O8uSBgk+W5ugqDjkSJ1J/SyKuwQ+5sgFGlTFb8ZmmMB
 4Ds0u/jSliYF7P9JctcMocvyAlC0DW+hb4VTyjgiDnO9VsgayBOsp43xJwenIzFqGjyeajsLmQP
 kA+iql1D7z974PrP2ST5eFojlrfp3r/DZWZ0x2L+TPFmBdhUI1tdpUAmdKTsUCBqd71bW96eELN
 /F8yh/XCSac+M9BRDm8lmpKIz4L/HahgvZq3/rdnHW31Vl1ZZNrT9NQjpV/mnjFherOQ/PUEUJH
 OIkdocj5ttJGIiF6jKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX0VncMR9HrUpF
 1s3cCYT7HbI6tnEvqvRnnW0RAov79pBeJX+V0B2+bvoLpNGanDx9Rsbmo5Ak4+JfriHN3YTTbpM
 Qd8fe2WH7DvB0QIZla5lwK/mZy9PKVk=
X-Proofpoint-ORIG-GUID: 6pb9b2nBsS0sLLtlVjzpSPjVSSmv8DVP
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af271b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6pb9b2nBsS0sLLtlVjzpSPjVSSmv8DVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_172158_842225_9E444503 
X-CRM114-Status: GOOD (  18.59  )
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

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..de135eee0aed 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5414,7 +5414,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


