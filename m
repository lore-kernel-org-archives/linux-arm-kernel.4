Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE28606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kazYre+t;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHD4ndNq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cu6P0oQ/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=; b=kazYre+t1cnvoiAWTrW1URJGTs
	29V4Uu2Hy449r/CYWSBcAVAXEfM9hii2YRLhqa1c96SUSipguciJ8PoHDWMmksyTiiCvulSnvfm3E
	ByFwvuPCWz/BCRNGnFYjT4LspVkJuLWup1xC/Vi7IBmd6Q4aXPa1iEIEAi19QtuIC16e438SN3J0m
	JVbN9IjxkrX5Fxdd2EHS+41kVKgxRuXLFGk9W0K7MydTJlBw3ZUL8Q6fs+lH11CUAJEJ7OJ/ddz6f
	CJr6nRP1bhxtP/mebAULkzhhVM5tSx/oaalIqXawc7V0HS6x+4LxN4pT5FD4w0zNQOBoUV7kk5Ii7
	JhL1p8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZyT-00000004jeD-034h;
	Mon, 23 Nov 2026 19:45:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZvv-00000004jIa-01aQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:42:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNJR2647182
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FcFkDguCD/ilInffZmCjUgAc
	HpkPgkVvkAaNeAEJ7sU=; b=jHD4ndNqjnzEpOp7UspnMzN5/djWeqmgMuO5E9ho
	DLvkgeW4Dt6EABFF3O7vVtIUcdoVCjho2j362cFdBBbWcpiXdASJz/jJ5PGtw6Mj
	xndbTqmmmiCl3X8ZKTrvuMQFrad2NuNRcOkOnRI8k0WmaO6Rb/2x31Vw8pZ1o/U5
	hwlQApGnztlZ7nQBBb7LuV11IgUob9XhYF56Q6ZzflQ04tLdYXc85XxqY2zN31YS
	1agpdCiZsP7kgh8Uy2MXjNmEmpvXmCpM3iGIOnEsvmHtja0DT6IItDUC976Q/98G
	wZv+JGyxNvSiQZ2XKOug+BgkuPRxKqLDY3Xjm8N9adRg9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg2bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:42:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso539757685a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462953; x=1796067753; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
        b=Cu6P0oQ/yqynapy/9R+gaVwo9URvCYOWqn8bhaV1zt2W8TujiZiiFeQI8Tq8gbej/4
         sI9v0/lW9J3doGGZK+iK0+oq7L01iH0nwQWNDVe35zv3SWhgGl4pGoXk90beJSr/xmji
         bASHrKjRzD0Nk02MaLUh5Y4vFahzgVFY1xg2OA1j9Rxq1Bl+zySBWnmxc+So7GVS/v+1
         ANwiDuXOdCYm28zHnyYVxxT4OKLSSO5KakvJmpCUG56aNoAnBHDImBR5WetHdp4yDibR
         8yuhjhqdKHpUvzN/dPiG2R+/NFL/Ov6GZoicYywe26dfJof4dXmJAYusj7QFBw6DjFxe
         l/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462953; x=1796067753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
        b=zlwMz7vhGRsCh0RMyYayNClVFDeI2xlcul28BX2hZyFJ90BpOJ1wieZZ1Bgz98CEmm
         FQhs5h+XJasT/BVY/LuP9aYr82vP/o25C0ZAXskR63YTa9fagoCpoZN0847JQF+9db/i
         tHKazSc5OqH5neh4Rioi2Dlo1qbRbj+PvvcktTKPe56CmGsaZ47/yRnMscUQ8i6QbOYm
         ixsMF5kx4mmR2EaIUj7kMuiskftvw0WCiMIJe0aDPYp2hVQJyPHI/wUTvewW//7NTE3J
         OJtv138nm3drre9Ckk2yWXpkMMIgIOteVn9KvHMpidr8LkP4/K6h2KKKk7pp4E8tUrNh
         5GuQ==
X-Forwarded-Encrypted: i=1; AL+hErEEwwxGR9sOwS7I+gqQFjywRMUEjZF4osIJKVoj2h7Iavcr1YYz2HkviCg4ZSxiP2rLIU2z7IXAZbDPxfUPwHoB@lists.infradead.org
X-Gm-Message-State: APuU4Z+zZIUSMgaxajCDSKyaMz2l/RLgOpjj3zlS59DoIyzq0TxWcv9S
	P45EBStE+iCxHZ16o7zse17HT8OV07aOGlNU/+F3kc2aGZfzHN7ExOAksSX0gZI58uNalPKEe3A
	8iYcgRn8d+a+//thZjxO4KOdzqXfmR6nfzpVPQs39CLknpwoHRg4TKk2ZZ0soWrxHakLbjMsfEk
	yNeQ==
X-Gm-Gg: AZFdTZetZitXgK2zuooy19BRd88BOlpQtwEskeeYfDwTnYeTmnSTLibf9ZOadFAccTm
	YBA024ExMVds4RMupmVU5IFgNcw2YtWHN1Chs/PU1pLVj7+eqA7kpkdaCxwLWkLTzsltCHm58Gh
	cWjWzXr+A/VY2kdGtwUCeVjGCfKYu92i2KMOM/RCQyU6U8qNHkff012neo3CXVfPWRa59MF664l
	7oNakLKBicVN9coEb6eyok1MMiXkkQsdpTx/j0z0ddxG4czmMjHQAa7TBdGfancSGThA/mccqLa
	vhWuvs0d1Lbc/xyQbI03GShtuctp8zlr9PHeHPlM6VNkR4YgXvfX8sC0GFCfvt+mjU9LGXSfa/s
	s6/sc1BAa+QKPguZeubnZiNbyUN2rhzTcbL2UVI8mRdKlWqf9L0IUuW/6TNCMzppP
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr2148822485a.14.1795462953084;
        Mon, 23 Nov 2026 11:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr2148815185a.14.1795462952408;
        Mon, 23 Nov 2026 11:42:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm374404505e9.7.2026.11.23.11.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:42:31 -0800 (PST)
Date: Mon, 23 Nov 2026 21:42:30 +0200
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
Subject: Re: [PATCH RESEND v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <2qyauqpne4p3a63jtwvvsbeyulgitvjrqmdija6pjkgh67m6c6@a5qe6jfxerga>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04972a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=II2oZZyV4uo1nSvD-RkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4DHwISvolOXc
 v5ErX/Q5qFaLUE0OVSnQUnXujSuKo6HTtx+m+tkTD741w/d8v6sZU6mVQrNdAjvdGa/mqgcaiLd
 nSGD2XtDm8QMioneZEMmT5OSwdGJzjz6yNIHGJ1otRMqcOspkcC8PCTyDuhBVbLjVtwEtucV9S7
 vfewIelvlnJ6JQgJzrYr35Fj/b7cXvUgY1Z8EQDs4fKsyKehi3Qmt1FTYx3PA7fsLciA08OAH1x
 oi9q/pQ+q5Or2haOS9Bnimi+5IK2bvxB31eq0iBvQUH1O3SQ2sP3Fjyhf2QH96rLXoMicNW9OUM
 oKCtMT88KJzdURQw8Jh5FVbI6gtVnKB8YXoHqjUfVOJf9/vYugNG7on93wwtpmglbWkUlE8zRCK
 3/IhnTVkMK1GAhw/hVptfR7KhYa/6JVAiHkMkcTGyDFDeIiHuJ6Bdk78yyFiJHFlBaVLmgsjRTv
 nPGHEeSrkFyrGK5QRXA==
X-Proofpoint-GUID: Fh214JCbQhH7tbZHJh5vGjKCMMkK9x1Z
X-Proofpoint-ORIG-GUID: Fh214JCbQhH7tbZHJh5vGjKCMMkK9x1Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxMtD3Gk4N7Pl
 Mf2pPVFyFsvze3fqkWdOEgBipICubUJB74D0JYhLHPsEVSDi8A8UXp3Pg5sX9ghQR7apsVMkpEH
 ty1G2bFjidYKtmcAxVk4b9W3Rcsucf4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114236_321126_5913A5F3 
X-CRM114-Status: GOOD (  12.19  )
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

On 26-11-20 19:11:49, Bibek Kumar Patro wrote:
> On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

