Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31771606A685
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5BZdscJN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cgl6mHPa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fId2UCk4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=; b=5BZdscJNm7PdQ8HioS2GcdMApA
	3B+X5kqE2yhMX2hf3pAd/o0HwWMN0lr7dZFWnNNCQ3PU9tx16fDKG8AXp6Z3a0kW/l1HA4QJlbw9a
	M/lIPfnOi6WHIsDJcN4vJisPRpOGyD9H/MzJllzIh/21mVM/CzNYwqEeI1eEycnEzvQdFqj7pftw9
	9801CLAf+nrdW93KPbMf+5Ti0bp2D7+ostaCG8OavxIyQ8RcjIgnBf/AdGV2C04oy9d5kcvLNljVK
	7/WwsAripl9725LFMooNp4PVLuS0Mmr+l4tTxc4Jnb0bGDdpeg8IC1UZ8bFouNqilhmn1k/APnrP3
	5cBZbshw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZyS-00000004je5-3MxS;
	Mon, 23 Nov 2026 19:45:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZvO-00000004j3Q-3zp6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:42:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGoMe3730237
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZP1stIFjrR21WZH3nap4hGQw
	nj0u77S9FayUUaRW8Zk=; b=Cgl6mHPaapfmVqEjDLCoi8m8UoIOCaiyU+o1IE4m
	/brL+hrT4eMFEVrdu5g2E8AWyTIONXkiLJXkzjFCPkqHfyKKMyuusXmsJMvmPcVc
	9tzlRSPqI7h8JdbaXm2s6AtA+HO6uPEF7d3IeWN52ptz+Ih/XsauATIF0nFB1K8/
	74Gsm0ztzlG/3knvjkac/GG6YM6E+R3nMjGCMfJeRc633jdP7LXCuHY72+AQiIcG
	0bZkDCzy4gUsrciYDgWOXmim8RD+l3i/HUrZ01tGVh5Cp8WlAtKCQU4GzuXYdzk3
	mAQ979y3apdgKqm4o2DkGIyUccv1kL/Ki0wm7APq1OiERg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd36fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:42:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so738987285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462921; x=1796067721; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
        b=fId2UCk4/QYE6RosylkzZ2jSVzTz6Wn2Kdu56VIqc5VkDkToy5jz0J6XBV0apV6QGE
         x02EqoLL3Ju9S1YUNUvYsBaYQUPAlhV21nfJqHncRDcKYh4FMREKdx/maIIlRty35Lw4
         qbqlLeQhfy99SltJmWF0pvSHx/ffxxuVjZgJAXSEtjRO1wFrDPXR3YNFm/lZeQJIEUoQ
         zqo9trN/qaXXIwMu3Z9H6ZDvMHj9M8kj6t1HnYSt+kL2WYLwmrnud/MpfhuvHwJGiS3H
         jdbnCZKArnhBx/ggSksOr4iMvRDJ1NnfvSubaVFfgB3eld1jDDTds6eRaM920+wSzOVC
         lQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462921; x=1796067721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
        b=voJgJsNrBO+93cF/zj0NVikg3q1vfQwdodaxegpUXM3ia1XFZn+nWhtTvanIVW+JV6
         W/w8LEGagCSEaPpQJFNgiKtMDfLUb0BKVe/TVXk7FiHhfbt3+z2+m+mlYdp98uhJtDyx
         C7otFm/2c9v+5oHRVNk6Faati1UGiheCafqDQVUuoSXR8wLJU+ZYiqWeadYOM19NPrhT
         cshOK/fSUeyTQHmLU67OEDsDLB7wdYEFMW7bjDumBxjoyaPdjzVvyHeOW/7urP1CMYDh
         YXsTzhSvK0m9Hx1p2xfuOXMTBJKRyaq7sfaXjT57PBqvO8WM9JX8eCIZXi1Su0olxYsV
         LNHA==
X-Forwarded-Encrypted: i=1; AL+hErGp0Wo+OMrPKlEQEHQs4Dd2Iyw8CxbikbXBAfTSffRvxNOcCb4GcT7au1X9EMsplyJKC9BND/TaxR8Hji1t3CDz@lists.infradead.org
X-Gm-Message-State: APuU4Z9KcGBhxqPV/CHmMz7iSJQSbs615PTk/gvZspPdNFn1f/5qjjsa
	kqlQhQ7P4/yItqfQ6Z0OZRf4twUcoADj2tE2AZncHplrRii+iRutxVhsW+fa3x1kYquLDZ/n+qo
	DjWjz1zNdkC5FHDDeCCgFTPOhgzIJk8VmM1s/pNNSmBN9vQxEaGOJN9quslj/kMhUJOhpzDnLGE
	NfTQ==
X-Gm-Gg: AZFdTZcy7t/HwkmATz/n0JeuH2fYhUEvV6ANV983sL1s3hjRXOh7ST/k5jW/7N67gSA
	IRiK0Wp62bU03nGLjov2w9WPHIM6HR41SGuIHJRhlgSJ49fqJIk1tl2cJYOT0UySFygtIl9hDhU
	T8qLKfx44bFK++sJChCjZAYzX7CbQ4qpwzITrxkBfJIgCHk45CQ3yKRItQjFk5UTDN5EBjPMbGi
	0J0M+qEXApn79KibvspwrsJ91o+cEqn6a+B7TTg0J6N5Nchb95gwt7aM9iaYe05x81afEbrHrjG
	YznIpXQhAPFzXKZEUPFR/gCPWzN73mf9lKcuOQpuVK4+dZcs1e32jA+DxN7MZCVa5lFtwZwpi9v
	N/xQ6R7dRO6pNdIN5i/QpTQpNl+fM1ks9H/g+/0Qi89MGWlZ920+PzPeZwDZQc56p
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr1912904185a.11.1795462921243;
        Mon, 23 Nov 2026 11:42:01 -0800 (PST)
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr1912899285a.11.1795462920551;
        Mon, 23 Nov 2026 11:42:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm24938335f8f.8.2026.11.23.11.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:59 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:58 +0200
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
Subject: Re: [PATCH RESEND v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <4ktoys4kreu45oyhzovmdc3pryzcynecdwqczuzjjppqqaqlca@m4flgwzgfpqn>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uuv1fSNlxZ-GO3YIs3quCi8hv4F9H62V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX0dCog6M0phw1
 5cv4Akq3TcwnQEtglzggejGXDLcWp6043zPsYeWXCVg1VMD9RQ4acq5+laeg8UhxdL7Qm29Lhbp
 u4OWjkujq4U9PA+/GsUggtkNFWzMTS5NUNn9MVCCz3cXfwHm2wxZTrjIeRH7i5bszFx9eSGYE0p
 2DDNrv3mUZZ91KD7e0ig8LyUepLayVl1mXW6xwo0yP6J4BHzIh5A4Ce8vGwgPCAvSZEg/x+QVGk
 +kfkMqsyUWU9bs8+JiquWbvXZypnBsLyY3jsGxLjxU7CT4Xg14jFgzX7hzNHi2x64H1LilNn4+6
 U+gsJQ3L4iTrDokaVDOuyZZ3L6JymCbPB7l/z//5twZ/1ufMGc4KzNjSLfvTVY52iYCe9qqXvaF
 brlg3NBKJqO4U+gKWe4SqRVW6051BXOxnTukRcXV90nrSsnEEO8AX+3SlsbORkdgSotJRUbwua/
 ipv8Xpdm/IssS9VeVHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXy+DAu12iR6TR
 wyDp1dcXDi8jlVi4u3sDIg65tDeZvjeRTuF7U3FePOHO40FxBRNHB3DuJpYWYvaaecCVvr+mUSX
 XhtRNJdikk961zPzOSx/6jM44IT8CM0=
X-Proofpoint-GUID: uuv1fSNlxZ-GO3YIs3quCi8hv4F9H62V
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04970a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qO984ec2hPs5we56H4QA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114205_142148_66DE425A 
X-CRM114-Status: GOOD (  12.29  )
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

On 26-11-20 19:11:47, Bibek Kumar Patro wrote:
> On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

