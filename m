Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD3A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I4FatDXc;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qOcIAU2g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=blot85h4FTwfSQn0FLKdi/Aa22snUat5BCH5SdoPrNQ=; b=I4FatDXc1RuMP/eKUg3wGWH+nx
	dAstS50pS8UvKqST9gslzt3Mu63RjlYwD+gbTceJQkZmMVDJVSMLK+06WGlNVmOUxX+v/F9Dlny3q
	UyNX+xnYYh31pDEeDhxxRqRVwPBKbYC9uZsw+XuxT7ztbfaLgJhNRceDEygKxmQVaLmnreg5FZA4M
	CpIgJ5VulQHcrdjOGMiRIaQ67GuKDtjf/xBEvl6OZ9AblJisbIk39Ay51sRbC9eNQ+S4icPoXM5w2
	0ZBZt7BEmHSeMtTdi8Sisl3oZqnZCuQkXO3SnETUxw/5BEyqB3BNhjRPa8G0PJdMebyCnMwKjMyhL
	UcPFnFbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPqc-00000002cMQ-3O34;
	Mon, 23 Nov 2026 08:56:26 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPpb-00000002cCP-17Nb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:55:39 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54iHO2622583;
	Mon, 23 Nov 2026 08:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=blot85h4FTwfSQn0FLKdi/Aa22snUa
	t5BCH5SdoPrNQ=; b=qOcIAU2gtepLYgLfbJ98jQ8TcFJrzKSHsQIP9UGtJ+Lx+z
	C1zFgDbKjkcE4oPYcwpEGEUjs8JE4mTi3u3H/s9SD8NLMJ3UcB4TVbeHU3Gt5gn9
	74YiQXEWRQHGF1rdZfqliKD5fJG/9rwysZPDiTl3yp7/1uR8XcR78MYAEVNxpTDb
	x73U/W1Mbp4BPuBjfQgL9nkBC/aP7rQpKACsJqOeYjnzRJg8FNSt8qbFmWsBcJz/
	jtrbuUxeW++85P9noyLYYrdI/9GDHl4YPEyCiw0ib6tRXRoxbzZLjxRrCgiOio4A
	CcYlFmZi0PCdaGg+4Pbrp14adjTyQhhIeRlb2Vag==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fkaaf7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 08:55:09 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54Snb1436617;
	Mon, 23 Nov 2026 08:55:08 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3raydq66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 08:55:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AN8t6Jd54591754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 08:55:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B3D92004D;
	Mon, 23 Nov 2026 08:55:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC13F2004B;
	Mon, 23 Nov 2026 08:55:05 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 08:55:05 +0000 (GMT)
Date: Mon, 23 Nov 2026 09:55:04 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 2/9] arm64: sysreg: Remove the dead range check from
 parse_bitdef()
Message-ID: <20261123085504.20959-B-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-3-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNCBTYWx0ZWRfXz4eoKD+96ZGI
 +Ft+L+CH5JFWXRxaKmq55nTM9hFGoFOI7xvVSbvbGBjMzaSKgICpPaEsyunKOw9ABbWJuWeD3gq
 rH+BLwtjI90O0MKSPvMiE1WE4+rAmHJ5Y1/4qJeTDP+2dvxsS5nZ6YyrqjXWPL2TcFVjvzcEe6A
 fGGMJ65OJheNgaFRgzVZFByN8Hr5aPN1T/XSc1uzNP7Bh20wdRawGOMR/HzS78McBL/b5QEb+86
 nRgR4WY/Lh4Npim5fAaqLYHcgYKYPCz0s5jrDXZxaw8ffD1imvMmyqezuWCfi4rJIsUWX/1AozZ
 pZb1A30zfVr2zY4jpGqD36zwWWjGkGoFZVTRgh82Qg8IogqTTHaQaFQpyLMqH3a4A1pzp4yrNbP
 aroKdED0wHkrU8tmXFT3ENB5u3OHUHLrknwImz4gmTAYTb85662RHXFn9saAf5YbaRupEiftiCA
 RttovEob/ATOkimP6nA==
X-Proofpoint-ORIG-GUID: Vsde5VhrwxKgUxdtipmkSSyiCyN8Z4HK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNCBTYWx0ZWRfX6ix2YiqYMjT0
 BSGKk6+LPwZSWHRVkLDufUwB8pcWn9yH+flQeNM96p12SUQ5N7tTaAvl/PRJx9LLCflBQgPY13t
 VAhPtkYbNHNI0rRQ1UJ5CgY4mcBvruo=
X-Authority-Analysis: v=2.4 cv=A9z5rKWG c=1 sm=1 tr=0 ts=6b03ff6d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=9VelDpYHchpW-k45WfsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 3KYqQyQzyg9QPHMMFgqHI7dC8L1NfRUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005528_586896_63974F9F 
X-CRM114-Status: GOOD (  12.43  )
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

On Mon, Nov 23, 2026 at 07:52:12AM +0000, Fuad Tabba wrote:
> parse_bitdef() ends by testing "low > high", but the script doesn't
> assign either variable, so the test compares two empty values and never
> fires. The "msb < lsb" test just above it already rejects an inverted
> range.
> 
> Remove the dead test.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
 

