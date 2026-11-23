Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62313606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RqKzs3Rm;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yxzx6m9m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g+vQVfZt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=; b=RqKzs3RmNrxVCfhdxNjV8rRoRq
	QAr9d0Mn5S3iwc9JvQ/wo8uU+WpT1ElYRz30F7F5Y3Ag+SjOMYgBY7MPzx58oG5g3kgvTJ/7Sh5Qj
	a3IY/4Yvaor6uUzuOqvSmpvD9aPL6AEz78IPc5G521i7IbD3O8m/i3eYDepckYNaG4EsaMzkj7h6F
	aLxKACuR1zD18Zf3TxmjygPgNe9v+EH+lrFraYc3Oj481Weok3izg/dlGzmxpkl3+dtZqDEZhWycv
	AJ9GHhHNaF1BT9uS1rJO/NTYRD7q9ea9+gELxcYVWEjzYsiH8qaZ+awkDgVpgIWhzbFXxt3YvRzS0
	Gr3C7IVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZyT-00000004jep-15OW;
	Mon, 23 Nov 2026 19:45:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZxW-00000004jZk-1RIG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:44:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnP53730225
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jmqs384t4urG0xO7kZnecCDg
	SxT8h0KsuOljD4Hr4ko=; b=Yxzx6m9meyKMWzTUoV4ZM00fA/PyHef1MQwgy++0
	RsvNxCLo4tLsnC2untVDjNHHdCQ9VpYwX5wEUV/++y0CugsVH50C62mvbhDkqYtN
	WsObSAYlGtkK8b7emb42vlaMjRZxilMbLZ4afLPRoE51dE8zanhqyuVJnGu20bxR
	tBfO8q37WsXv6bJzgMAAElayDj89NcOUIajq7PWYVdPaXOeMBhaFW54DESkD9qgI
	TR+irxyQpXpqKCFCc0RFn7BepbJAEt/iaiKHZjXzriyAH6D3O0umBbtlDlMsGc8g
	ED3iJAs96p+kHNqiozocaNlcP5qjyjs3iTh+A6kCtoGgiA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd36su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:44:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91256a7b7b3so56245536d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463052; x=1796067852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
        b=g+vQVfZtH6dI+2wgIos/mJJnyApR/XRmDatdhyQgFySfjr+sBIveeJGxgbB489OUVC
         cUokptZKlirRV4dGxdZO3l3LmpuDjmWL/xRNXV+UFya2BCuUvYMYaIiWHvdRXLwKBGrg
         XLbZRwAnbU7v0Ij9i5GpWo/h4umaGwAuuMnS3UgHXyx/VPXCEqD7veAtHpH8Gp7xCyWK
         3++E+V21uo3dxLNFv7JOfrogRAJeu4aHO+BlkSHpXnLLC4xAQIpaKod5+3sJhRpLwn+S
         1lMdp7YafiLd7yaU17umfe1bMnVBXkYbpXl29MXY0UWc87q0pAGid8rLjGDLqcBCjRMT
         XuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463052; x=1796067852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
        b=z/pfzsPNFP8ydoYCew35R0D01jTBBrMukCu7WJM9/8F96atOa9Dw6oZOn8gM/gZ1//
         3e+fbDSFhCmonR2wtN38wKr14I2ZEtALOcCJycSjMAtSA72JSs6pufai0NcK3lhp7+X+
         Ym9SHgXaRnm4tYp1cm4oEG3Sr79j1sBlLZhZlmqb+XfTCsTA+xOZKKy6WUXYRT0LTNLu
         lirOBalSZCksamMvquHgciQpvqZ0yj75dzl0mgh2czIZ2rtiUugCwL7w+k2QI5NAFR4x
         /Uz8WR66CGJfMuMuPdlQVAVfpRrZpflYGy0kb1Ys9in10L7BnodmQLgd2Qxz2PfaIRJb
         l5PQ==
X-Forwarded-Encrypted: i=1; AL+hErEN3BJvphpKFGQl7El+OnhxztbM+N1PJAQP0w+oA+kQ4SnnrJIA6hDjyDPIrJvN0BQGtkhzOY4p8evIdWtr2cfY@lists.infradead.org
X-Gm-Message-State: APuU4Z87r/WMMtPO5mU+/XMHYzZqUBU8lFY/iQAup9x+3Y/Pga29g6Ri
	ThckTdQpnNEbXxICgBjf4TuIK/EnnJJSvyFzgxcSTuYDtuO6mpLYfllUqJUJGxSxA//v5MJMU0H
	2jENHIQNsp5t7r+4ORRtmnG9eBGCUYTJnsHAWPd1RBQTq+RQ5ai1kD80t/w6dF94Bwrw2SXXPr/
	nLmQ==
X-Gm-Gg: AZFdTZcVUjatpF/t/3aGfaxd9RYMPGUHPNzmBlO5bd7nokZfGZM66CSujc7E+nEblXu
	C15huca31UAB0FtP/CdOt0g7cUPT/zXtGitEeFbwEDgT560cbmSaNgQSiSzX4d/OWWx5N4zcs5X
	rnvBi6N6kCtt02xDOmGMDvf7jQZWzpjXVfjN0kHFBybmSBg3SM/2zU5AqwLpJffAm0YxZlPze+E
	1pla5gLi6eVs/AUlPu65+zRd610VN3n1/LFGCQHTxJjSCmOh5baUKmakhq7QooKme0c6IRTKDFE
	HGDS6+tQ+UYRPuknUu+bze+YlH7bnSJn0jXaY3EZCJCVfx4znu9g46fuJVhDds5xH5bqDQOvTGg
	hNSAUlKb76FRzxAsVIdD/jp8b21XLhKY773gx4R9RgrzTsUEmk27ZPEV7PYbgKgJr
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr2063644985a.61.1795463051622;
        Mon, 23 Nov 2026 11:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr2063640385a.61.1795463051048;
        Mon, 23 Nov 2026 11:44:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm27593394f8f.55.2026.11.23.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:44:10 -0800 (PST)
Date: Mon, 23 Nov 2026 21:44:09 +0200
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
Subject: Re: [PATCH RESEND v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <lafjekmlbln5uccdgrqqrclgoeu7mrsgxbuze4cu7u7zoyrplq@7qdploxt4a7r>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xs3iBctQX7naO1q_MwkDyto_lQ41lmOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+iIsP4jiqbv3
 hAmHvjxYo5Zfcu5AzeQzNxYgMabhXBm3PCtdhmee1qMa7lAAugZEoR8RDcYsK6gHULlrY+wjf0v
 FnED5Ly+5z7UEK0hYV5NKzei2j9OhWMscqCvUxhSCwNsKBKsJPhL37pWKVZoGp9ZmAMT9XSTuCb
 kuuwGRHCFNXUyKEh27DFwK6jmn7Tbxv05jCRTkcb4wuCLw88DF0JitTYBMrK5xDPiXCQz95NWDj
 Bt6ok/H/Jt/R+PixPa0oZ3yDu3MaXL3yMsWAW73iheR76CGbFROYgQ6TsaM3wq65heN4D4BGk0H
 FSWFKLAiIddvdD1PkjxgsYqM6dCkuDgHL9N10Mo0z9pabt6mk2AcmTXsJAbiVzmj28f6ZT4Qvxy
 10x7PR0VfM5mTph7GDBgaNf0d/AAuSyxCv3Yc+NQFO9dPBWkZcFzwYqqNo/Bu9Rtrx3ZbM3ozJ8
 0QeqWYGOBBv80hlnUxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+3jRwKkLDSCX
 x/DkZ1FFEMSUFLRP6wO2MpD7ZOmxVGnRUvgaz9MC1fc3VK+EICu63tmu6aZiJrBDsB3fqIBCUYa
 mRDafHtl4ZWPCx1/rzpsvO7VkkWIe9M=
X-Proofpoint-GUID: xs3iBctQX7naO1q_MwkDyto_lQ41lmOp
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04978d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114414_619078_03364ACC 
X-CRM114-Status: GOOD (  12.11  )
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

On 26-11-20 19:11:51, Bibek Kumar Patro wrote:
> On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

