Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83023606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SxX0wK0J;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s4L9LCAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4eN50aRSkmuIllrAwA3eGaHbWzAQeStB7tViCqukEag=; b=SxX0wK0JXNcTZldZfaG7flNfDC
	T8SnXN+6gxQ5U/97mPDRkYi9DKEgOBvl+jNmObIvFxSgHq5j46Wen2Y6AC3T1nBezw5LU9h6aQWvi
	7bIXBpfoJ8t6HcEfIxtU2pULtLGFBFjg3Ejd1MjfkHo2s2WEqVn4e2ERULLXrJHHHaLn9LBfhqdEH
	TI/ShEHEq/EcPZ7dedtbCKOLvdYHhHohoZVv7hhBVOGewWZRpsBH/fFh+2yigUkabKI1ifIeouWv5
	XvdsJTtIZroCIR0MntyAFdEKwdShRb4E/wXNQiiq3kxGF7jd/Pc09SY074ptHh826Tap285AytUEP
	BAuSNCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRFq-00000002wQJ-0DvD;
	Mon, 23 Nov 2026 10:26:34 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRFd-00000002wNg-0qjL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:26:32 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Yn3E3194730;
	Mon, 23 Nov 2026 10:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=4eN50aRSkmuIllrAwA3eGaHbWzAQeS
	tB7tViCqukEag=; b=s4L9LCAEzjKgMrwDPzRHyjSZoIPNB0oRW8iASDgA/u6kaL
	Z0QexILtrfzpAWswFrUBj/KXtDttE01I1sbbfB7j5s+kP8puOqSOrr9iokkgtrdF
	bMaqAF6oyiCGearONdNrNETC2JuwS/OATIEEMauR2UR1FeVpD6V/GhxQSTYM2Nz8
	yul94VihBV/QFmeHn/C1weM3mTU4xGU9AknqjZVWMV0+S1mV/LAckuCvPGrKFpT3
	lxg9cKdm8RkpPuc2t10kXZPLevGCyKk3PQbMck39yzrvth2mR37DsxI8DfM0mcrJ
	H5Tn8bWyCD9cCFdA8gyrbNST4vUIQpV9FJlD4qFg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gv2ber-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:25:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9JLQU2758544;
	Mon, 23 Nov 2026 10:25:55 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3q4h68v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:25:55 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANAPrR330933680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 10:25:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E35D2004D;
	Mon, 23 Nov 2026 10:25:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A39392004B;
	Mon, 23 Nov 2026 10:25:52 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 10:25:52 +0000 (GMT)
Date: Mon, 23 Nov 2026 11:25:51 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 3/9] arm64: sysreg: Reject a Sysreg and a SysregFields
 with the same name
Message-ID: <20261123102551.20959-C-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-4-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-4-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b0414b4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=7CQSdrXTAAAA:8
 a=VnNF1IyMAAAA:8 a=vdi0Nw9sCHi2PksTQLIA:9 a=CjuIK1q_8ugA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MCBTYWx0ZWRfXxawTwefiZEFd
 8ki1jNsC0l/e000dPN4H8gPLAmAvCBVANmdQjH+VkVi0tCPWYLN+SMW/xA3jgpb362UtZpdWIG5
 d6lrM+jrPtJkjJCPmI5CX0de0sPgKkI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MCBTYWx0ZWRfX4C3zhOnZ76ch
 lHVHDp8PDppBymVX3vRw8rTXr8NJ1yIAUAP/LZSnM2g1mw4V5wyMoX8hGeoHwhjFicEB0/xLhY8
 qWEk2meOQVsXRss0LlABSRKHy09z9s8CQdhDsCaGoNIXv/zR5pvDn5H6tD3uEmtZQ04kA/JGg+w
 z7Y2ksTt/Ro17Sy9LNWYE9Ipt5cq/yT1I3KKLWp7CKS/B5Bkrh63WvThTGUyfqcFXfOYrTN6fib
 cs7IXN/Skx/9nu1f4YG9Lqzex1MfK/4KTqpKu+NIIydcQPGuw8EMYHfr5KWwPO41M3R3OXxd4Lq
 xncBbUtzrF2txfDGZphUP8mUTEKuk+byPP/N2MxtCmi0TarJOAIN+FaS7jatZjVMEgQ/icXvnrK
 3vxkhhvUEjF2u8MOd0WJbYn+LXYhk4FsjRDk+fx36fQgeM3H8SvSeT+dCRyic3JcJ+8TSvh8yHk
 gnPBdmgqnPZDgoT7zKA==
X-Proofpoint-ORIG-GUID: ufQakVupHdAEZCAbNSvHXbnQpvA6LqrO
X-Proofpoint-GUID: h1tNTLxIi81xYYOSn31DZ0z_mQhtzQzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_022621_840424_56DBBA4F 
X-CRM114-Status: GOOD (  15.83  )
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

On Mon, Nov 23, 2026 at 07:52:13AM +0000, Fuad Tabba wrote:
> The generator rejects two Sysreg blocks, or two SysregFields blocks,
> with the same name, but tracks the two kinds separately. Both kinds name
> their macros for the block, so a Sysreg FOO and a SysregFields FOO that
> each have a field A both define FOO_A, as well as FOO_RES0 and the other
> masks, and the compiler warns only where the definitions differ.
> 
> Track both kinds of name in defined_regs, so that a block is rejected
> when either kind already has its name, and leave the kind out of the
> error.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>


