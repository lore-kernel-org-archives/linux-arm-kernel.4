Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58673606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iz6KIY1A;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bySchDoK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDcub5Ym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=; b=iz6KIY1ACfziBU
	SZMd3J0YEAu41mrXSW0WUtpirReKSugBMBNXYvK6698LEFRJoIRK/L+P/cbkN9CE5PRcTQfuwwZFY
	0O/TXm3gqcJ1VlpbSwb5Oa7nax0kUtaW/Xpz3o0YUF2KbxkseVwBgYd+Nkc09DUieGHB8AzZtHKtu
	nBTNaWOAtDuTTEdTj0rL8I8RjqZr54y2meIUnQiUCzCdlVkXx5ryXEWO8AUju0PYy65hIvD2h8ZQs
	QiX9uyfq6DAJl1IeXAG66HTPahfMC39LUN6YUoYAj7+uJp2nl8F3iodWmydpEIrjd6NVqGjtKChkr
	FyqQjuTqSl4O0sNUGAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOiJ-00000006qn6-14Dd;
	Tue, 17 Nov 2026 19:19:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOiE-00000006qkc-2s6R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:19:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6O7J2161033
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 19:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=; b=bySchDoKDpg5Lyxf
	LPhloKc4BcpgB9pLUWGjAuXw79fUW0N9QerIdmZa2zgUPU6hOlNyUtOWD9pX294u
	SWlI23EpZD5+X0oZM3Zm2C7ILJApd0GUOH2dVm9Fv6XBPgvNpcUqrGP7Y07A4ahf
	KApR5X8Tb0hMKNWby5sul0fQpuVNj97hrCEBbN7dWF/Hw+kdt9yo7ZGclNQC64j9
	L82FzEOeNwDkVE/9Ir/J0WGcZnoqkRvWkOWNZ1tL8doSs19JwqmtBEvrw78KGvqB
	YMjUH9PKmKO71JHA0Er3vPHS1T3NMzPUlNJsfA27Zz1AMIYB3TbI7AnK7EGcl6kT
	1YhWnA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kccaqtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 19:19:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313c7315becso25587eec.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 11:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943165; x=1795547965; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=;
        b=BDcub5YmANkT1qp2cV/Xd2GH8rfVmyUeQoDMyqIsJgBTYNVpYtu5hmi/ecSaI+ymlL
         Y01iM9ZHNbtQC8GNCs/JJ99GfUTdUdYHJ3D7SrZmGMVUs/GrQWUHgRzDd803NekTr+kW
         glCOfNAt+X3OX0x2mBWXSRQBEd7sHI64prPc3YY57RUCSX5vNxBk0a+k4FJDKF571pHT
         2wKyniqgHP8G1AB+8Kyj4u8cEacXfelrpuObnpDdPfwys13NKZrHeVrfp7gd/90Nvx+P
         /pCpEpVdxnfGvIZHxFJi+PNPuU+do4qC7XWL53DLsYoxk77D3PTLVougIRSTthkCSVdC
         +9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943165; x=1795547965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=;
        b=NNo081NowV4gIElV36X28+tmP+IDzoo1XZLO7CSJ9GbLpOCnbLlKRy+oBTEHZ0fxF+
         2+o8M6G0ne+W5NxbHqXgGE3aCgzmgY0eLJDvnK9uinMZwBdfqhaD1hNBx0GUbeW2auGy
         WCq9Gk+JNbB7sPLu0oINeouhdOtHYXlJot5ZjY/dsNGtpsnVEOCkNHBYkoYn2+8Oa+dC
         IyXV0+0zQRaTG6fojDAXo0kXOsp4ildRqeZNk3ZEhe45swdFQAUkxg5R3kQKcXrbAcjm
         3NoAxIwLb2JopyFD7yfhgvdgzIJztI2T0mpewdWQqHqVB3hFRWvk4b8WLDC1oYtYvvID
         nRSQ==
X-Forwarded-Encrypted: i=1; AL+hErFQjEzCAiziHptyLZNWZJ2SgIWfQzfldeGZrUKgrYde5cBKIgK5q9nKqbm1WqC4XP5f27MPrqAY3t5sXJFXqNyp@lists.infradead.org
X-Gm-Message-State: APuU4Z+rAK6v2M1Zo66k+3U7IYIWlDX+p91/TTfIBwxSBMz+F2+9Ukbh
	+3jUkYg19S/qLuI9dHfoLe9cGdYTlxmKSYNTBwMyZNLcQDJGMc4wX9tcuY0Cj/jsUTTkCD5eN6i
	oxw5SPyxIf8AwqR0qqXejsHQcOfOjZHhWYa/DCs99dVj673k2GbpGBkEZgl4cvoyMPG+D19XFvR
	FAYg==
X-Gm-Gg: AZFdTZf6mtIj0qnmXdOWIgOP0WSk0kfMRZXWzR+ItldV9Cl7kFbsVG7C4fRpzQXkDu/
	8MS56P5LhchXDSBd5ww32/lxftUPXQs6UJ2wNZMWOMKbSaHmV7W+1S7R5Uj/33RH/8sJ0+S01bS
	9K5t9Cc9TSu+K96DSkFz9LILwkqiBrgSnq0es33lUiMJu/3B9SULeP7AQIfEGRUhr6URpLbVqRi
	jFK+HAC/IV6lMwEZSSZJ15ZqSm3TFIl3tYQRxm9fWanWnozZv1da3YIYcqsOeLirhjv0Z+1XX4k
	Mz784v9qgRCmIJHbKmUpzBB1sufuQ6qSkyUhYj3TsHLtMAb/RuX6JjI3bq6N5Jcn9GxMkeJ+kuC
	rDGgdKFmTqR1C0eroxMaicxxlONQJW7Rt29TWFEo5FcoOVH56pAQYnCur9J1yIsxQaG6+pNQ8c1
	ZtT+Wi
X-Received: by 2002:a05:693c:2a13:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-38280a3c36fmr442124eec.2.1794943164663;
        Tue, 17 Nov 2026 11:19:24 -0800 (PST)
X-Received: by 2002:a05:693c:2a13:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-38280a3c36fmr442083eec.2.1794943163858;
        Tue, 17 Nov 2026 11:19:23 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:19:23 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:24 +0530
Subject: [PATCH v4 5/5] arm64: dts: qcom: shikra: add RAS error source
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-aest-devicetree-support-v4-5-936587251e8f@oss.qualcomm.com>
References: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
In-Reply-To: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=1782;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=l4p+6RAlvNC5E20oYKN0nb7ff4u82f7dc2bTNZ2GTI4=;
 b=li63lc5/FvzsDhC0OVMhM2fAI1esfNRVndV37bAWoQ3HYHw9IMhiKeoAnPaF6wan56EyMZLvu
 4CD0N0soY2LCdmRX3A8h88fCBd4w+B9c0Tf1PKOMn3wPYEePiWS+WtX
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX1P7X+JwrH1ME
 NXObBzni+27wiF+3m4HajyYnQuWax9FStEBWUgwM4CMdyjbbr8HOTK/64lC+8/Dh5NTDHZ7B2Vl
 KSmxrxhz+hwuQ2q3FAK/m+aaH2Zarfk=
X-Proofpoint-ORIG-GUID: br3eZf0rRJ-iQdVYe_8mX3aLgN0n9XfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX1oC81Ux/vzc8
 BIPyj39DW1l0VELhg6nnNVqjo2rAp4oWvhNaansJNWnGmfmIieNLif92eRJf/r7KsLi9aocKUyg
 FNPP7yhjMgfDvSbIUuVNhtIXTW9H5w9TIdLAdAq3EWu6rJixWblairX7GK0R6MV7BWrwu4k3G9O
 vUyfpr+9dkxCGVwRf1kZgRviSxejbMWti/cw6i16y+/OnmDKM67sa5opwnt0CjRChF1ueokFl33
 5WYME+k/6gCYhqM0L5sAEUpR7mRi4kRJ0esbGJvY8HonSow0NTKKwARMCBKj7+Orz3+XBxe7xFI
 2IFhuFM2h6vdIwnCKbNEyHxqvu94/Bc5caqV1xJJpEr7gCnTb8pyuAvF4IAV5GvjzNu/3M3WSFz
 QgqyzPYsGakHlix1THtH9H25dB+SZn5K0/oX8JCsg37CQ36GmzQtxqwQC6An5cef5lENUY1csRl
 Z6+OcbB2a2MrhaZ4bTw==
X-Proofpoint-GUID: br3eZf0rRJ-iQdVYe_8mX3aLgN0n9XfP
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afca8bd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=a7izLWPGlrKpK18tDBAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111926_849982_4BA947F2 
X-CRM114-Status: GOOD (  14.90  )
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

ARM Reliability, Availability and Serviceability (RAS) enables
processor components (for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Shikra CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..5c4a3ce34717 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -332,6 +332,26 @@ opp-2208000000 {
 		};
 	};
 
+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_3>;
+		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_LOW 0>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "fhi";
+	};
+
 	modem-etm0 {
 		compatible = "arm,coresight-dummy-source";
 

-- 
2.34.1


