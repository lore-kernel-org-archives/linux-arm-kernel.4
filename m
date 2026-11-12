Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB206606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2uW7lax+;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2/jZtNk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RnXWHBMG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=; b=2uW7lax+jTar7k
	fHcs5Sjv0jmPYZGQWqxYKUBTxiER4m0dph91NJ7EVl/an9/9JplE5BH21/FvLmqBySHg1V0udy3KZ
	MfkRUgMOAqhkNkxpIpjlnexAfb6QldZ5o0y6rYo9KdgkaNtpXFtp5xWIeXPZFYVCKzLXmeTY6h6uK
	vvKhb9bO0i7uN+22sXMFDLM4FnfJq78sESNaaM9yHNVKwMWLdh+/WJZsRKZCElNiSC81yxVFBznmF
	YqQ7jVtgdD+d1qUSXv4yP5X+4t0K5Vy+gD7ROvCRo6Kwdpopqii+s4K+ugcaobQuCdPmq837VDISC
	Ff74J3vwMV/yp9meTo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZ85-0000000ApoI-2Dlo;
	Thu, 12 Nov 2026 18:02:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZ82-0000000Apnk-3BVF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:02:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZs51011948
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=; b=A2/jZtNklLwEH3VF
	MjxWSGKtysNcngnLz9nCc5sc7/gnGbaGuYZ7zGqVOcKlM3AKsHIhmaDNdYQI4ZWi
	az0VQuSJZy2CM9eerFUxN61c5NsUuQzxiT8gItwg263EYYQpvSe2OFTk1hHyIHWv
	zj2A5PMIXu8TmQfB+bV94iuGZi7aE2RXG7j/lEkQz0san5pM0oxql7aDbK002WSr
	q3YACElXm56wWe+/r/V6oMS73GNwJk13I7nFJ22sdQaxoLFya70HPeAgeXEJhP2C
	IZFSFwkvlw+nRnbXeumYkkoleNslYC3xwOyapsv/o/316CYMF4zOohQxHMX4w/kE
	hE54bQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1b8p72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:02:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso365421eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794506549; x=1795111349; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
        b=RnXWHBMGA53kJ8p1AZMdSGDgA2su7Ucl5Pl58sHHCkxvZVkpee21BnzNr+PG63nJth
         S6mnMM6sngZV/fXAc5upF0JmstOtZdVjaeg5WngIVqfYpmiW8AbF3VWD5FT/hr19rdQX
         0ki86qvR2AF6e4E6m9VmF6VyytlKyagxYiMwvtX58TlvlEhw6VsMbIiw3DW0lA0GCqRj
         YkOumAESzhrbZVwUJ1+He4pyHbIAYMQbD2yrTJKLtqOEkLr61ZLJWrf8UsilzDc1GzIU
         3RUbrAJJZqPhswZp+ZDhdDJLi93+r/zvPfzk5x7XN6VBQnh4DbPpJXV4bocHxdUiuIsk
         Xk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506549; x=1795111349;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
        b=aThRnjA/dosVUG1/DhTIrQ88Gc4GyyGaS+5lOTu4b3RF3NHhlf5CVUftgMP7cBDzUh
         QsQ3mQ0CkDCxoeyZc6GQqMuq0frgU0jgpTXU1hzTUlii/4XNgG+luob7sGYXsrbbuwjl
         kqSzutuIMstLRDLRkhLLBIZgNFxfoj3Mxjt1vnHElOps/hHJuiYyE2NLGSU+Xjl4ZBWG
         MqV76G4uOjErXlhbJFros+tiHhrSJFj8XeDyjN948Cya6M+AG5SOOm1Bu2wKTliuJjva
         jzL19ZkCbxgSXlw0AOB8qh+f3jpidY+EBYu4hFSEXtsQzzi27M/1ER3HC/RJEPisDq4L
         dsDA==
X-Forwarded-Encrypted: i=1; AL+hErHLDHpZNJvw1fZlesZSZPd/baQjH/bhljGemb7wuD0JirEROmODEzgV7jrm2oLKPfdDx9WmuTAqwUL6XyOO89HZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9nKW5kNHxUXADS8u3OjlsrnAFd7Gy7lGOi8nOjICkYMY0pc3a8
	TrE9qBdCpEjFc1hYERI+bpFDdqgo5MIn+uqCLL7hnZiO1fldCdsGN2iIgHbeu7n/sxXPOQdEbuA
	pBxiSmhvScRzrpk6PIFYSd1dgXNtIRE51mmSTbIn/5Ozxy/v+Scipar0yA9uDt91bIG87QSTzIu
	KxfA==
X-Gm-Gg: AYBFou0YikSMcMieh6WmlZGNvtLu0GUh/LmFTfFxUBj2njyMV4OcMZHH6XEB865m1dt
	+gZm4x5lpY3Ng6cmHMMgCDz6sEf6MfWAmxCQKLbFB0j8cJuGottZbN28Y8j8kaNQE2G8AIyGrCA
	igajULBXHLpLqRztL+cSDn3chzGEt9AWprBV50Ix6CsLTlThKwu3I7MV8zw12UAe7nZtgWsJmE2
	nGzxY3wuv/6n/d/6fSL91OzrxFs85RGWt10a65ITtnQo3JZ6t89UslDmrllcNadcmrsgVCQkvFg
	Zkvwp4PJaCB5ChEg+HqhI6pEakasiEwLlyVx1e5N2oTNPxJCYw1yYhJBGso984YhnBlxh8yZBox
	ZIS6cbGSylxsE1VllVHhNBrIzfll61RTduS3UZezUh92UkFAEEryYFHQDA+NGHfH75dVA1G6GnO
	cS8oEPqj8Gg1qBdeSPpgm90xvb/qo=
X-Received: by 2002:a05:7300:fc0e:b0:376:9e80:2bf5 with SMTP id 5a478bee46e88-3769e8f760amr6022763eec.38.1794506547883;
        Thu, 12 Nov 2026 10:02:27 -0800 (PST)
X-Received: by 2002:a05:7300:fc0e:b0:376:9e80:2bf5 with SMTP id 5a478bee46e88-3769e8f760amr6021582eec.38.1794506510251;
        Thu, 12 Nov 2026 10:01:50 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm510064eec.8.2026.11.12.10.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:01:49 -0800 (PST)
Date: Thu, 12 Nov 2026 10:01:45 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <20261112100145.00000560@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-11-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-11-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af5ff36 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=eWwvBSKlxOWLqK439NMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: jI9t2SV2tIQQlnlnwjwKrootFdqudBAr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfX9U9HTr8cfy3K
 DNzvdky9Xb6dCmet7hJmrDnUPRBvMKq6U7uqiT3VCkZSnOaLBiINUHGK9oDlzXYBfSauxuxvVGX
 ksN8m2adH0JGYQxJEMt65Xl9L7b+VjP55JbmBDVtRy+4Vk79r3DM7f5s1tFu66yA9+k63qKGOEY
 08umEJmZMqXl0Vg/tLd4yjjiih3DOaPmQif3ud5ow3D2Y0MvIp2T1u54d6wIb+9qmpGWAnqhGQG
 czZL5mCY1Je11pGQY4eIHRSXNuCqpTgyxzTWu8EsoFLHgxHefX5g7obAwfMURCcsFu0+E9da0W3
 hBvp9kCeuAr7ROLMxr8qHYLMzWupH4bnwJjRHwHnrnNm2J4k22aysaBsBQgSqmGMOZivlhRn15x
 oAcgaac8LxkBNgWyULBPWgFhbyNysQFWXTG0lKl1AOpXR7Mfmtfgf9FjshoENgFU80WD6H/1Ed6
 LPqVaN2dIxRcI7RMkgw==
X-Proofpoint-ORIG-GUID: jI9t2SV2tIQQlnlnwjwKrootFdqudBAr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfX+qzqhprX9Zqa
 wFsfyE+j+sVExMZ2ekSW+yElMj8yATYthgO2Yr+f21mFywZsgrwZoMDcxoftqtXfpii5rXNuX5A
 iHBReLC6ShXHLPBDnXuaH48bj7767Nw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_100230_842330_FA3D1DE1 
X-CRM114-Status: GOOD (  16.58  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon,  9 Nov 2026 09:11:56 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add basic Telemetry allocation and initialization routines, introducing and
> wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> optionally using a lazy on-demand scheme: this approach factors in the
> flexibility needed to minimize the amount of initialization work based on
> the effective access pattern used by the upper layer ABI.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi Cristian,

This stretches across the patch set but first elements related to it are
in this patch.  How do we handle larger values of de_data_sz?

The spec allows (and it's useful for things like histograms)
DEs to have an integer multiple of 64 bits for a single element.
In the shared memory buffer that just ends up with a bunch of matching
IDs with discovery via the parsing done in this patch.

The only (I think) today to dump that from this patch set is
to use the shmti dump interface.  That's not exactly nice!

I messed around with (well chatted with an LLM about) a couple of
options.

1. Make the whole stack aware of multi line DEs. So all the requests
   get to return more data.
2. Adding indexing so you can get a multi line DE in multiple calls.
   That makes the interface for a bulk read a bit odd.  Userspace will
   have to be cleverer given variable sized elements.

Given this is a ABI related aspect, needs figuring out sooner rather
than later I think.

Which way do you think makes more sense?  Or am I missing something?

Jonathan




