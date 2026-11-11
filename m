Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE0606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WrS0bVCA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnjWMpqk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QovWWytC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BW1yja6PNKybb/pgnVziGD3AKdRvCLYee15vbiBT5Ro=; b=WrS0bVCAh3CBb2ccuwp3bLR8Ds
	+FQUSYf7R/erNDZDwFpv3o6++yFBvp1aNFZDJXJv2XqaegXn94/zBoXACLvBWD2bj48fymQSCO4P0
	Ch37z+0+CBAOQxfj7PZFBfAmUb8pdWaRi4IDYDzhPC3u9gpZ9SD/VsHdLa6OeCrzUbe6Gax45gD1c
	sgEIeDqTL0i10gtBTLwknFtD2DSGrqaI6dxVBUhVo0Y+K2UX5s05qMLal4covDa1vlFIcuACWu1hh
	ECnCnly3TO+h2ycwy69qQt5o3by3hVFS/LGftNesVWwF0kb90d8aJLLhaykvQIe9LJ0OrcVuVI1vk
	cZpaVSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Wi-00000006zZX-0MGs;
	Wed, 11 Nov 2026 14:42:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9We-00000006zYc-46H3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:42:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEKZ5a3510951
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BW1yja6PNKybb/pgnVziGD3A
	KdRvCLYee15vbiBT5Ro=; b=GnjWMpqktld/wlG/bijOOYuZ5g8jQ/zGglj/ukII
	rjoCCY/2NDySMtOMKha7d9STFuZf/exApjMF2m+6PPy6uOB6TneNhsQML00n2qYA
	pE1+mP3kC+/oVFffR5LWmZELPsxu39lTsbhre6f+sh6RG4PKFjDUqmO+0CZDdyvz
	fEwNx40cKDaPYrGpKy1LUv+2eWQ/YK76xHRdv4y97EeItnVrUdCTgcLTKyHySnfG
	AOn/F+/QQCitrzietwaMMsEYHgr8c2tnrcNjcPVEI9u1sleMwRfhcsOFlLg588lH
	Y9pRNtvXGAwG5wLJfTbmJW0NVxljwAlMttGF33sHU/a1rg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u82wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:42:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so622324785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408130; x=1795012930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BW1yja6PNKybb/pgnVziGD3AKdRvCLYee15vbiBT5Ro=;
        b=QovWWytC8ALt95tSfGNeKLqTQ2sdW7w/jqZ2bxfFD8BCmdWq+gewvexh9S9b4W9WzT
         Y3ivbP5McE+pVtwx9SKXtjbz7EkBTOlCmr9OLqmKDg6s9CB8oj7idJI1wvTxFQYL3b1c
         CI/DOC4RQuaCpn/tYxAEsOaIJcput5xptWdlSe8MMd+Dhn58FT8Sys2vETPoE1tMY4wD
         FeHWxkfk9IHmDM+zzmOJCX01gDqDdakAUSdQR7kbVSeeGIfm88nF20WQdG4kudx/gsUq
         rxq39hDTyLO9xVygyEcOhKuk42vVku4fXBGFEGlHYCweXfPn9T+RNLKcPKpA1bp4zsTH
         KSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408130; x=1795012930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BW1yja6PNKybb/pgnVziGD3AKdRvCLYee15vbiBT5Ro=;
        b=FzlTtswSbDnLTMc8iHY3aSlssASENHnGu9k/ER7Cm3Pd95AplvcaUjgxJKktRs5Pd5
         sTDqEQwWch4/7aisWBXcUlGH/+w+A+tnkZvslfRwJmHLRPW9Nl0ifsC9LPusGc0n9U0M
         HV8Xf8drILTRfLEIS35vedv0HXGC9e/b4bpqmM0vaj9B3w58+/tnVJWI6m7Kg9O9bel5
         OARRVbQy5L/oXIjrEqMUCW6s8P97NT3njgpZNCLCuLlAG1hZOJci4moCrdfy3Ytkhgp/
         uWsWzPB67kCz0DSFJ9hhrGAiFIOOX56ya1MZ7aBFtDe0Pd0z0jJKessWrNSrqEkZWmLR
         FDeA==
X-Gm-Message-State: APuU4Z/Uep/BIp48falhkELtekoCAC/P4wfF9ndQYJoHkCxwlwgrVawh
	VE6fyA5TnkJTJdig1vKicGV7Xs3pKMjhFKQl5yGygptSMGVA7HJxL1r0GIAI9pdODatcgN9LX/4
	DpICv1bLQrhiA/8EHYHoZEv+anieGgPU7M7b1dc2rJbFDmyTVBLWkkUv+tMlf054ZGnURYUtu8Q
	tH+w==
X-Gm-Gg: AYBFou2geitubfw5Nh4wwhL/8gDC4jzyYrYGnqDvZW1SN7NStoRKtIXPOqAwnQKn8Vf
	kUbR6QnNy3zMgf9XNyxFLLgAdXexqc2zzVFWnovkhaVr60Natgxa7vGkPedmNFsAi4lTYZLpE5b
	UR/pr5PsCGpbEzgwPO2Ajdcv8i+NiB9uX5A6Tfl8OaCnx3nzYK+zyIB1DdoUte80fe1kA+4xgNY
	hexZxCANoJMOv2ZEMI/szP/Ib507V8synbsQm2BgyGuz3EytsKf+v/alzXouuVMzvqjqZUvWaiX
	NFglk/bY6UOM7B1vfeewpG2XsGyYO8jMY8pgBDeca7MycQJuy1vWK5PfhGDVB0qmiJH9Ec8tkZs
	W+mV3GLeYPUH/edeeTVbmI6K2a+USv5U3nxK8V0ptiq2ULrq298yLArycGrXAcfea
X-Received: by 2002:a05:620a:1709:b0:93e:942f:b8b1 with SMTP id af79cd13be357-947affc669cmr401697685a.64.1794408130066;
        Wed, 11 Nov 2026 06:42:10 -0800 (PST)
X-Received: by 2002:a05:620a:1709:b0:93e:942f:b8b1 with SMTP id af79cd13be357-947affc669cmr401692785a.64.1794408129484;
        Wed, 11 Nov 2026 06:42:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284cce7sm11855545f8f.8.2026.11.11.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:42:08 -0800 (PST)
Date: Wed, 11 Nov 2026 16:42:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sdm845: Bump fastrpc shared DMA
 pool to 32MB for 16k pages
Message-ID: <s4nesb77yrzxk36nhrqca5hit3lmsnw5n3rsa6sopta6crbbur@ttkl4iftgl3h>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-10-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-10-ardb+git@google.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX0WSxMx/KqsVq
 VerSP7zTuTlkboql0ZUI7Kg6UQTz0lCWieEkU4ZE61BLPzPRNCe6ec4pbAO1ShxX2HjqAemmjsW
 s11frj1Vr4AmLoQErSic9WX/foL0Xuo=
X-Proofpoint-GUID: 4uy02JWcNcYCzy2JXPYMrkaN5FHGKZ3i
X-Proofpoint-ORIG-GUID: 4uy02JWcNcYCzy2JXPYMrkaN5FHGKZ3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX5NxYni/2h1sL
 Ka6w9qGCSYJwiP/5j9zEFnt7CEkRRNxLUgtc/kuctQM3zauUsepZACwHnY0p7PCzymw5KIsEaX2
 lWNIHf5M2qmr5KGpjDPTGDDTFpCuwyRQpdxrBE8DdC53bFve3o45PkKU9L+qvU1O1CBe3oOxKq6
 jXqsQ9k0KJjB6XtwBnPySduRtB6C0hdFyKUMUyKeW659GFwJbBPxDwPe8Gr6ouoceIKnAj2sTXW
 twqrgFPAsn8MbXY5aAItAH+bvMLkLGVlejN7RQulbYYJVBk8pYSEGvq91XElAT6rq70asqzu7rD
 9gQUHeepDa5CMydAM15LeywnW5XC8dYZBLIHAsZGfMfON5hWwgghx65+T1poUYm7XXePqapf1Hz
 kFsTdO+liVs0VkCrYPyddgqVbBlE8LsQUv6GrCbFAnvc515i7xIEFu/rFZpxTeLWYmVLjwxdRBb
 fUc3JlxXFYTa6ocL7tQ==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af47ec3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q0vFCno5Q2I3JVtQNlIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_064213_076509_5F9EBA6A 
X-CRM114-Status: GOOD (  11.84  )
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

On 26-11-11 12:53:05, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The CMA driver wants memory pools whose base and size are aligned to the
> PMD size, which is 32M when running with 16k pages. So increase the
> shared DMA pool size from 16M to 32M and set its minimum alignment to
> 32M as well.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

