Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D9A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y0ZrfPtv;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KbRP1oa5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KwKJYzn8WLQVMy0cXsVtL9y2X6vJwk+tvAqZ0nntlug=; b=y0ZrfPtvist06Hvr0nvlw6EBGn
	oQekBDaDxAgH7hEiD/JqMzatLbz1RVkLHQPinr3rH15g3JVGMOtSpvbCsmYok6jC80dCUzMbyo3Ds
	E83HQqAYvbmQn2o1T+ze6owe2GC2XCfO/y5RVk2VJ8hpzxZl9RJaapc93ZE5FPCM/ntA3JFtgGNmi
	hWnIzlpj0fRRlYoie3dSqid80GoFlWDTXn6uQxIsf4M0BtnndJsVDBjuL21Tb1ERdtY0+3bAptCuu
	vg8zP61/qrqfhq6fkznDjUXMSez30LA397Sg7yoJAOfFREPrxROzrvxOI60OZ5DLPLmbsA8tt+kul
	Bc7uG14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRqg-000000034hA-49Xs;
	Mon, 23 Nov 2026 11:04:39 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRqe-000000034go-292d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:04:37 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Z9Pj3196021;
	Mon, 23 Nov 2026 11:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=KwKJYzn8WLQVMy0cXsVtL9y2X6vJwk
	+tvAqZ0nntlug=; b=KbRP1oa5AZ4JlYwpONu3FypgrplczvmHk2hlydqYySpVFa
	TCcgl+gwvPQqqkFbuR6HBidx2m+qk59S0WrzpqYeVplhzDbltQIriwK9qS0QI3i0
	E3aAx0m/GFuM3+xSc23ZXv2sZV4yJUDn1ZwX5frcW/t7qUJp2FE/tp9sCqVblCwX
	dpkAx2pAwfGZ/Ex4YEp34J7bxfy22IM4FYBDgETnkezzMrMnafKcguIL7hHTjfJL
	DhiOfkshVojuGvBsgGE6OkIRXgLX2bF7FLueZG6oCK1xqEEx++pGh2hiX4G1YZlJ
	mJd1H6vsajHjvna4XKQQaOL0v/Z5h+bF38X4Whtg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gv2jk3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 11:04:25 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9JFB01708379;
	Mon, 23 Nov 2026 11:04:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3raye82n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 11:04:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANB4M4V48366048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 11:04:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 307402004F;
	Mon, 23 Nov 2026 11:04:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B40C52004B;
	Mon, 23 Nov 2026 11:04:21 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 11:04:21 +0000 (GMT)
Date: Mon, 23 Nov 2026 12:04:20 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 8/9] arm64: sysreg: Reject an out-of-range register
 encoding
Message-ID: <20261123110420.20959-H-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-9-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-9-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b041db9 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=149SWqO4EUXa_a3VMKkA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NCBTYWx0ZWRfX/p/mgF/oVxwu
 MsWELUFlQ6fnyRTu433DmD26/OiHwcfnxDAlvH/iOXjfzQYZ96VijlBOBWSXUFGfSzQT+0JUwY/
 OjnDcjwbiCrn+3utPYoA725c6kbcy7A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NCBTYWx0ZWRfX4TwFNvg/RiSm
 WcrZcGrn01rRCUhDkBJwUbcARVUX1vucRYyzvyP8o5uQUWDpezU12kpVRpdElNzJof5bTzfE7cQ
 1KDA7E/zAw/GK81JckyG78FtxAlF/5XOQ3Ku0n/CbSJNQc6MQF9MUScUFbLaK22JYQ8IYdlgWWc
 YKZVJ8lIcX41AKWEEcL3HVAvx/d2Sy/7+6k78P+aZwQibT8s1ZWHoE1nKZWllbuUdYvRf6U0iw3
 vAPSi/IC8g/H3tp+enPuZKNoxd3sFRK6Tqa0pIGtZveaWPu2fuXhIvylxVS5a0YabIQ3i23W/Ct
 N31AsB/dpOCsOq2a8G+B7u0YKFZIn0vMbr9nWGzqEKU/1re2/DQC3fwixggOWlQCbEARDr+bTdo
 uAZd2xKZZXINSB2f1FNSjObVD2F1hGy+VSWZzHw+7IcYloW48rFQ9sWeJqVnEZluuHu0JZEm7z/
 IvdFqY1VbZMavt6Bsug==
X-Proofpoint-ORIG-GUID: qrxfSx8q008Zk296eaXtaSfY9F604lpj
X-Proofpoint-GUID: tvYF5jnjzUW0RPVVdEUe5xUsxMQa5N1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_030436_686917_BC170A56 
X-CRM114-Status: GOOD (  14.85  )
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

On Mon, Nov 23, 2026 at 07:52:18AM +0000, Fuad Tabba wrote:
> The generator copies a register's op0, op1, CRn, CRm and op2 into
> SYS_<reg> without checking them. sys_reg() shifts each into place
> without masking it, so a value too wide for its field spills into the
> next one. SYS_<reg> then names a different register's encoding, and the
> build doesn't report it.
> 
> Require each of the five to be a decimal number that fits its field (two
> bits for op0, three for op1 and op2, four for CRn and CRm). Reject a
> leading zero too, since C reads such a value as octal.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
 

