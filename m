Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D66606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4jZeAZ4P;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWbkcHLj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SoRUfKHq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kRPbPFA5UaW8RQT7bD0uzKcSu4cYs79Tdy4dHl7KdtY=; b=4jZeAZ4PdGEKqLhsyn8bmttXon
	/PL1yMLHp/D8xQ07ohRfFr/QK7scr1B+Vmg4WyU5lKx3M17up1XHflcq5zcwPbZ7IJhHwT5AtAk5t
	f/WYRr9lhzSj9a8qnc0gumOWrNhjcC52f83InWOA3B4eFPb2oMmfrdwSNqrcxVoILNBLfq8aXsT44
	nCyxVwxXYADe9ZcZR5e971z+dFK0LblFJYCgpLf8w5Q9fKyEgQTEwGPEEFHCzvaqFQFUMgR6bx1AV
	3f0rJV+WCF6XTdkhsq93Sh36e3H6xAjB62PcrlzKOQEuGPqhHA8XIbwVUULWzwWHRXHJxBzQqClrK
	A4/rLuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZtN-00000004hoi-1trU;
	Mon, 23 Nov 2026 19:39:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZsk-00000004hQe-3bye
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:39:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxSu2377202
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kRPbPFA5UaW8RQT7bD0uzKcS
	u4cYs79Tdy4dHl7KdtY=; b=NWbkcHLjy/t72kbbZhxphVhgOotRbFVZeU3gmCf7
	MN8hsmw5vSfH1vrzmSar6UKjUi2kZXsP4XJEtLLIfhEXufqXDoBjseO7zFUYImsa
	Z18VgkFxTBZdnwTX88duQ+/f+ZqAsJwa+rQFrjqD5T4oY1RBfXKRHbyOLQ1HhUip
	wxbUSarHXgl+um7Ebg/v0fdx6Ne9OkXeRNMZRxBkzWrOfUvxmuPxPGQv1Zljr4HK
	dUxXxyTFvIuK2oCAlur7cEHXq6+Bs25PBRpP0X3n8+zHIuluxSePyvqTeTV+emcr
	lNYGpEWZ9RiPpyXitzqqaBSR1IKk7k0ONubHxyRP5zwjbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut43e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:39:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso793941185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462757; x=1796067557; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kRPbPFA5UaW8RQT7bD0uzKcSu4cYs79Tdy4dHl7KdtY=;
        b=SoRUfKHqJsRf5vgboLM+3k/KFlmVKCwQKGtpr5iBQcMl/7GzykDMzhB0nK9Oq9HP9l
         HntTTpube9m8yQ0FlNCJJMhy1IG4f7oa1EffDwFiP0fmgQC7TrI9N/WMcRRfQamZX+jQ
         TkdGV69iX2FrarvndUBWRo2giPVk+NvEhk52hXCMjAgNP1tX6RDaV2WC7k6HugX2J8vW
         hjpJ3jr1a70C6lxIDelIdjJBA6x3NnwiIbkPZWDkVBtVrxg2RXKTeKKwsxF3irGAXHdA
         yEjJ8eGxTK6D30sVMSUMBm2Pqo+Cu44c18pGgjbVNMhEO9WYDeEMf535PfZQKPoqmdTy
         HPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462757; x=1796067557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRPbPFA5UaW8RQT7bD0uzKcSu4cYs79Tdy4dHl7KdtY=;
        b=uHd80gcwfPbOxTmNgf+rxBQ5TaHgyphLPam5kst7BDXA8Nkt95zBz9lShRLqc3d989
         43+Deyv/ieejwtKk7E3AA+O6u8B8lTKUEvJpJIJNCQ15oFxd5HR1NaWjksQpEOvg61EC
         Z7VvvGCarpWM9bBWaEEY7cU2x0rCWfeErzlsmU13ijwjjxEedPn8XnfNM3LBYgZaGPUu
         Y93yI4rWb0rXyI3DL7WdCfOEGatdZwZJwftWClceSzLfzWVFU7iem7YcvBUMRzEB+ZOc
         jQ3c6Ah768cD6ElzRiNhfIevyzDN7m4F3T/tc38Y+a1p70ClZjA0QZ5phHSdZW0HtopU
         v6Sw==
X-Forwarded-Encrypted: i=1; AL+hErFDBet240nNWDSmE8vDifBOyoWnPP/JxLWJycsBlD4XX16OYq1yNSy62+ThFv9ENQeCokTZUwv+zermaV6Nct0M@lists.infradead.org
X-Gm-Message-State: APuU4Z/PrYTnG/lyeLY1ZTRPK1t1E2O8xP6Tuy6JBKA4xwo8GHQVczLZ
	oghGdekfja/abxleY+jxszDgzG/o3VlAloJ6/uOWNwsH3DCxNjXDa5AGW9AqqvzVXfDAfr1WTfV
	JnirrkB2hEHiJ8tr7RUz5cGYkuKYdnMT/5YMD6nIFATL7jNqpvlvOeDg6w2qdsKbUilKQpphqpq
	crhA==
X-Gm-Gg: AZFdTZfybutwsSF1upjp+c6MNIWUedo1KFq2AWxBMZkrSKTkRG9MB55HXlkCt+ngJuV
	b2kDuP+Z3QkeybV+Lp4obicphF6nKgZ4Cw9ZKWuOIDOulA+ARtzZxRLjMjTuGaLGDX6bhlck+63
	CQiuDmmVJ38OWLjo7pbe8P3ZnmbJ3yleZq8DtvU7PIUyxD+IpatmfUoaZdvBHPihZ/X5JxmRmpu
	maQmTUj5ll05mdFsXANX9zxdtPzmyfmfp5d/41qYo7D4HOIo8NJo6NglEfrlusYEvXujTEKQ83o
	iknAV1I5ic3T/aRR4fQfWOX0hYjdtZQ9d9ZDlOE8qOPGtSUHPwNz3OFn5qtq/qf/9VlaOLr7s4v
	Yy66JSY4tQhJY7H2IeeRhCeoc2RqLxeXjKnT5zMec6btcnXPGrnfoY6m4EOAXrFNH
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2389699285a.29.1795462757031;
        Mon, 23 Nov 2026 11:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2389694385a.29.1795462756273;
        Mon, 23 Nov 2026 11:39:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm550952365e9.13.2026.11.23.11.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:39:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:39:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <eyx32yhvf2rk27k74vlordcvqvfzugbq22kjju7mijwccltgkc@jbez65qjij5f>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LModAlNbzrRO5JOKYJ_88jxALnHFlOBw
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b049665 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LikcBPw_WjS6U_9SOOMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: LModAlNbzrRO5JOKYJ_88jxALnHFlOBw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXzGqM/vJsRkQW
 0OybdkCUrrc+uCGiFc7Gizijnjbg1VJaTD3IVWcfBd+0P1h/uQp4f1cNiR0boKpzlS50VdJj1vc
 1UOLFw6VKWYNNXqOrcmrCodzbyNStFY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5e0X1VgBxHeh
 znHwHm1hBBfzLg0Xf7ki/QX0thQdLYecZu16CIvmQWz5f+UOUms3uWKhAhtcUE9TBY2Vtoq465W
 HkHGZiJRq9KOa3eQYDUSfcAqgUIXVoQvfBRxib0jezjqZtPZNPTZFq36nax+gWk+IdWT0l7l4Ju
 JHE6eLtTZez7AgWhQdLuNec9YmUKSrjV/n7ryzPW+Kz4F11VVSBJPiGdawB53AJkj/x1tjExklT
 EyIq8ikdrUF/C3OZ0n4/ggJ6BG9aEVQ2tnSVvkAgxenmfXIoPYnsEHljB8yx72AU0VLb12qU0Rc
 Yp9y2VSPipy+LRoGNE70h2psn3xG40Yoc94abgZJsZhaEDEEAhxgZL5pme7VdIRXG/EAVrTlH0t
 3UwtozLUH+5vhQl2IEmHN8t6LSLJjRz4ZMuPK+Sw5d6ift8q1Wd4ZdY3UGaomYQ9IO4sZ/H2vN1
 dKuJD6ef+3A6RuvmkJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_113924_850436_3BFF2201 
X-CRM114-Status: GOOD (  11.89  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-20 19:11:36, Bibek Kumar Patro wrote:
> On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

