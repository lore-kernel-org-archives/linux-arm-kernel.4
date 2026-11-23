Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890AA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=licqMGYC;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k1PB6R/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x+gGftbRHFSjjMtooCgaTjgU4II0/q4+ovgYoYGeY08=; b=licqMGYCWRGZeUY9ua5P91QwV0
	264eSO3fTdJnWSxVz//YtXs6HKndXCQLfzkU9mAFZ9HVVk/hGBQjp/pzAPYjhUfj7rkjUxYitXz5L
	OHQ9H9yTjbvWyXMx42R4YCgViUid5LC5nLsheUf6l18dyjAOYai9CR8w50oD/88OSjpipsUPtGXnG
	+JWrxSQv+en51yItO4wZwf8abVvms34Uwwl/Ed1BmJi29o7Zli/xrCPopGAco544grFmzxYissVeE
	ox9VLbaJ/X2KXTr0j8WU8D1BO25G6iJ2KH7YRJgc6qmF7/otqGMi5bE0Idmprgp9LG6IDbMycbadL
	CTBYlQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRTs-00000002zzq-0jNC;
	Mon, 23 Nov 2026 10:41:05 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRTo-00000002zzM-3ezK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:41:02 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Ygwh3385417;
	Mon, 23 Nov 2026 10:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=x+gGftbRHFSjjMtooCgaTjgU4II0/q
	4+ovgYoYGeY08=; b=k1PB6R/+61m1vjo//HxxoPQ2a1BQtCzVfIxHp8ABqC7f9N
	66Ql4sOxTGyfzg5AhVfzMw0qbVubyy2IEC+0PYdnsfcS13WoaFLWlzeggk8YbHeF
	C1R72oFQbQ0A/boXoXh6nGIHtBsHwavaHDBDzv68Qiw27djZZYRLMMP6ekpVa9Z0
	4HQXl3wt1jOP9taUoAItagdIuM/HyV85BUWQOWgeWIX1jkUHCgy23cgbFsEXW79T
	qe0M7Iw9Me4RqEayVFdi/nYe16r7EmMRQ6RBX70LOUzkRP6nEVyMBk0moX51LUhm
	XXPNErR3zA8yGd98tbUc3DROL2RvO1MOhSs8Iu7g==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fa2sf2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:40:39 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9JE0X3088763;
	Mon, 23 Nov 2026 10:40:38 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3pmjxfe0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:40:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANAea6431785640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 10:40:36 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D7BE2004D;
	Mon, 23 Nov 2026 10:40:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 325BF20040;
	Mon, 23 Nov 2026 10:40:36 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 10:40:36 +0000 (GMT)
Date: Mon, 23 Nov 2026 11:40:34 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 5/9] arm64: sysreg: Reject a Fields or Mapping line with
 an undefined target
Message-ID: <20261123104034.20959-E-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-6-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-6-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXzCeWznFjPIy2
 HVKqOBQiLscNgXewFPy+gKoqfp7STCVj+JaCwQk1kmWHXwxOL+OVhpLWwS5S2ztMmIFPrsBkRYu
 C6wYkWWqqlJywbdY+DH0DV0hsCdTsZPkzUDg6s+mmPYqUp55gkRvbwr9Q0g8mrY2dRqiDpcHF+f
 dOwhv5n6MaJV4w8N+tneDIEa/b5eDtI4jgSt3M5CIyGIMJMegcGIGbwiCvHmO27GsYH7pBjRMvW
 ZgLr7aedRo0vxw7wo27etqC8H4fP5KLxePEKiWt8entqng4UGHqXDvXc3OiZKpCnUo6UdrpKW88
 QrAbvtcrwFqDXnY+wa7OWZa633I+mEmm68l0+EhtPVU2R6nYVsP16+RAZAB/iR93uOdUyN5IJux
 Gh/NDM8E6snic5oIEdd13DBB93K56OFlCKNWQOg52lB/W+aIVyay0+I8AyB4+knq1/WJ8b5OF7p
 OESwUIGUxBan8yY/FUg==
X-Proofpoint-ORIG-GUID: R28LBXb8yXFjeAkLWqi_9CuYsk6VMpdD
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b041828 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=rEkJRZTFVfSPeZ2QoV8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: sxok427SFCgBSa-a-aV1rH5D5LkdaNw3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX0cej24OK+nsL
 0tN0yG2Ag4syhosi1bnvPka6cENOh06GyFTDOEOo6a89t/Tm2HJdJqvTYMj0xU2BWGeXmtZ9yil
 YZhlWQ6IxcsU1KWEFW3NdDJfKp3WjSA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_024101_020305_5556F934 
X-CRM114-Status: GOOD (  15.78  )
X-Spam-Score: -2.6 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 07:52:15AM +0000, Fuad Tabba wrote:
> A Sysreg block can use another block's layout. "Fields X" names a
> SysregFields block and "Mapping X" another Sysreg. The generator emits
> the register's RESx and UNKN masks as X_RES0, X_RES1 and X_UNKN, but it
> doesn't check that X exists. A misspelt or missing X gives macros that
> expand to undefined names, and the build fails only once something uses
> them. MPAM1_EL12 had such a line.
> 
> Check every Fields and Mapping target once the whole file is read, since
> a target may be defined after the register that names it (MPAM1_EL1
> follows MPAM1_EL12). Either kind of block defines the masks, so the
> check accepts either kind as the target of a Fields or a Mapping line.
> Give fatal() an optional line number, so that the error is reported at
> the Fields or Mapping line.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
 

