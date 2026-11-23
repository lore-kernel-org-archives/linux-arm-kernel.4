Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A56606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lH+nWfb2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Nz7wR/uz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1IV8A8d;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdSsgJYl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=; b=lH+nWfb2/Ql29dhHzpvR3bXvzu
	JuGSEPIKq8dKbaEtHzn7LOzYllLG5ruZTTkjON+gaPPWuOGjqA5wlvBIniOBCJgraKS8g785L73Vl
	3/nTXlb6ycMEACVm44n2+Lzc1g2x3tQhIENMVpqN7NMVc+tMxpq7GVqkyKWuVUdm8EZBRhDHyVgwk
	UdW4TCK1t0nB5uK89G6RtE+IJ7+TeXeJb7KjDhxnyVscIlB7LEFtFg7noDjemFW8hiLel60jsYZC0
	5rjRUXsyRTR7h//iseC0PRjFRLbImQ7hE91GhiRKC0grtGpGUuxk7tV3r3nqZgD8/CGwozTFYS3el
	RT2dUmSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZvR-00000004j5Q-2qP9;
	Mon, 23 Nov 2026 19:42:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZvF-00000004iz2-2E1n
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 19:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=; b=Nz7wR/uzYCKDXRCcq/IqjW7d9e
	bQLzBIcgJlhtupDkzmBXLy64LkM5+EyTPiNfYdk9Wr+XvykKA+X0LmV61rMoTQ11BPktKRpZAJMQe
	rODF8f+HGL08o/S2pJTCM0vNSv5MVRxrfxDEA4vDTqixzrj47QuLANrdMi0phF3KoxSPsS7EWahVh
	WlWM+hvKjqgvHbXogk0W/mUl95UlZmPGYwkiFyfFq6rHqugcg+I5bwNhAGOc2xoZxUBhYGt6XhiRb
	i95vvetPqQTSLVOilPO9bJpJWg6VQZmygbcSMAMGJBwPNZABVxPxA6lBfNblOY9Twet5/B7QqfoZY
	+WK7SEyw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZvC-00000003XdM-2NhZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:41:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNErI647023
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fhajorqknMVWTu/OeYgSDpH4
	HYLQIjY1Z2rYoHbqGco=; b=a1IV8A8daf95qZ2Odpglrdwrbg8g+pmFIBoDfUk1
	Q0hFEqYN75XFdqNfo6dwlXNLnzXuupGJiWHsupkEx++C6a609ZowOUiGrbl0OMw+
	+prfpJWpQqZOjBBYexySVC9ukblS8varamMvEPEeiLra1Bc6qe4McaS/VoBMJr6R
	a227v4puWMSArvQL7YtxaqByK60q22kvzZePpGbI0wRB0Y+9hCH6vmhL5r8Vxc8w
	QAVi+U6rMANRi3mpcjSXrcg6gUfgGfjaZL2WHPia4wVEI6qDoz8NoVMASTBNyd/C
	FAB6qw4wqzzbccvlfLftF8PZQNn90/71gkTIJ3qNNB43Ag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg278-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:41:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so696060485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462908; x=1796067708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
        b=TdSsgJYlQXz+lMUdrmhHv1qwbUOlloxd02ng/4SqDpsCUOQkB3TItW307EcmfyPAGA
         q4n8ns/WPfVl1BBBlG+Nj6otmzyXskMHUoPOvGgKCC0+IEgfoPAotOuMMW4Y1aBrBpDT
         Weu2IUSZr6sVMdt+2eo3iAx4zwybZ3BexJMZzepgpnPASHsFT9K+6Cc3g6vYKhS3GeaS
         znif/LocTWg8prT93habTMfarJrTj2gM/eJxKtk+jDtxqAWNdgf1jlMx5kFpIl+Xs61I
         Pic2XvNDtndAkIGqBp34Ih29IxxLHV+BNEY3rdrVPGpobe3IcLs7fkLJC/inxPgLceht
         Km+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462908; x=1796067708;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
        b=DnLuJIZLQO08SepQgIFzZFI9sVqplRChxzP3SOxb7jTt/1PoplRdJNo0AiHxw5D2w4
         M9gccXeJALZTCgp7/s//1iDWNQfDYwGvHO0Lo+vP2ssCwM02Hlbd0drnEgJ4msn/lnsP
         C2AFG3YRg3fbEtrZpbpiRIx4XFiMKs0OdEW6II9FVLN+zImRTmDv5jtwYnZgqM0UBc/F
         lggsO5Xy+GNFyTYQM3vwOcCNF99F/ZuikzrBy4OOai/oYBdwhuQlLB98BAVDo8rJhd/f
         u9F9J5WRAu5JDhcjh/MplfiAuo6Hn0FAJ5+qpCHneepCQFGzOJ7egZZ5BKNlXdC92ITd
         RQOw==
X-Forwarded-Encrypted: i=1; AL+hErHn+bSDLPP3uk/2Eva8BiYxKCCi07umrd7/SNF0yQCHj00xUMjeL8att78Wa6Wb4lPs57hdQEJCepglTG1HVK1U@lists.infradead.org
X-Gm-Message-State: APuU4Z9TB1pYThsMr4FAsSp/ZmDHLedJz/LcZtPBFzTJDssQxCEQe4W9
	ex9FWpW9adr+BGnHimJNQajmORrWhcQlPMch/sO/DCkf9VReLJAb5RLj49LtFVjCKVCeYY3rNou
	gGyUTrJ0K25U7//pR9qXXeG0zWW7ZJTWh8z0o4V2rsfVt8QFgJszKFc0vkyL4OiybT0vH2ylkv1
	fMnQ==
X-Gm-Gg: AZFdTZdXehyIWMkPpaiZvU9YOGaAqWMarj3xO9OAsxYlYIENW5GDEuAwDgXgTjv8gd0
	EwlIH5diKYwjrsL8Dbala4A6Zo7ZshdXlleWvaBhPMShmVhpEAiqJjjBjz/qVQM13FYxz9hypkk
	dAhaoH9GR9Q3hwHvzecLdwlx50+Ph0FBx9FQnZU591xVki30dwES3BRaqjeDyokbFrW9R+RA6Df
	vvxOHxIoLgyuiqiJu6FKDXdolW4KakF8tL2ZMIQOtwfhR822seipzqHfIRiSPFeZTq1Td5QqXyy
	4/M3TQRs0OvDbevg5ZezSZmfzcpFh9ErzZLvPhzg0SNCyD+y8u6R9JEdhZ1fRffrqLp1Iy//4WH
	tVDvn5ZiW3GAnzbx/NuJMX9BzvYW1FxuHWXlzX0XoGHUBaV6xiSdq1nSWRPzjgJEF
X-Received: by 2002:a05:620a:132b:b0:949:52b7:468a with SMTP id af79cd13be357-949ba9e0e0bmr2222150285a.51.1795462907689;
        Mon, 23 Nov 2026 11:41:47 -0800 (PST)
X-Received: by 2002:a05:620a:132b:b0:949:52b7:468a with SMTP id af79cd13be357-949ba9e0e0bmr2222144485a.51.1795462907102;
        Mon, 23 Nov 2026 11:41:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm535153725e9.11.2026.11.23.11.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:45 +0200
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
Subject: Re: [PATCH RESEND v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <q6s4lgilunj3pikw44icbwuwq3cdlk47uw4lg7iyww6eaolzie@vaux3olznlsr>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b0496fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GtCB4xAyANLfO_zL0oUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4LtnR/iskWGo
 Q3L/xhVH1X057rFCCnbuxAGBnfnBHQMP+GwSFC3GK2jr4pEShbVI2DYMOAr/Vj0z3QyOklhgW4r
 jSZWKkGpzNnTCEPIMX8tzB/oxtFl43aGPZApBh6RkVnoZ3Pcnv6C2FnX6vJd3TC6DMBibzBHZ7a
 ZDei57zJg1KoFq89mAeXv0maFcMnWLXZLKVwCCabhmchNwDPiHD/HjNsG3509W6jdGmyzzy1BuB
 ySx8eGTIGrHUb2MPxW7cbT1bSOyI5vVpy8IVQ5p8xUpkFPMHQ6BFoUDbYd3ywzL9b7HJohcqfPm
 SHRqQ0eT0gJNUkYmHUwQLDCt2ee2/dG49jy/hwXcJOn0ziooYGnyGrKz8Wc/6pLSMwk11HLbV5V
 3J+7j+hD+6b8ybazu1t0F2tP2W8l66Wnoj2c8BFRtwSu15kpw/YKJXJm3EDQHo9c7cPT9h5dlrU
 Rmmnk7OARoe399Qg6rQ==
X-Proofpoint-GUID: CwfXMcVJhNk9YkshrU5gfGwbkeDe0w8o
X-Proofpoint-ORIG-GUID: CwfXMcVJhNk9YkshrU5gfGwbkeDe0w8o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3yRg50Q2wr4n
 GvrvaX5VpPBz/2yJXHtgh/FVn7mLojEqB8O1RRnnzyTeh8r2zjpKlMoVQMIyKBIRc+ErTXLhAk9
 gl3ZRqPp4Z26+K7JCtqcLkfKaYmela4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_194150_654810_5848906F 
X-CRM114-Status: GOOD (  13.48  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-20 19:11:46, Bibek Kumar Patro wrote:
> On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

