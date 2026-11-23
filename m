Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59976606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RIfIqn5l;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lEAEs6lm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cgxjyQhXD9NpZCRkhkchBis6QOSlescr+1fDhhbFa1w=; b=RIfIqn5lPQ64VGzcjSC9UtryEo
	2T4nS24T5Ky4kW237GboMR6Q1VaRKNBlbZzYYcmzvzC3z1P3UZ6j/xDuBBb/Rv+jBhSFB4eUuCAFF
	kcnBE1vmnNaZ7trX8gHVg3oIe7OJ8HPwb6vvD4B/euDkW8Gqz6utBrctgukGPIcqPnB3Ya5FOa/d6
	C6EBwSBFtlpLuCo6887VAxadRXqokgZaQeknxLl86dIKyEX9PmZuJf3n5bUvAKyk6mDHcBESP9tDE
	PBi7fe87T9WO4+q4PXI1eI9+YwHaGfowAJfVK5bv+njddvQ0dhGFeoYPAHwl0VIYFzBZwf9uUsctZ
	8tXgdpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRJO-00000002xHC-0qix;
	Mon, 23 Nov 2026 10:30:14 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRJA-00000002xCn-0ekZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:30:04 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9YePI3194618;
	Mon, 23 Nov 2026 10:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=cgxjyQhXD9NpZCRkhkchBis6QOSles
	cr+1fDhhbFa1w=; b=lEAEs6lms9Fo2+gKoBfXZN4tXCVLnvwgndv2XkbwyU9/sX
	Y8GJ/dDSbJWORPG39HYoDT8+x68ZLEjjD68p6qctgRAVIbpTsIOwDaqbZeI9Dm1W
	/m9STrvFIVxJAWqwUi+j2wF3jCnykkg+WdXEXxAgziBJ0XgWiaqTbYGOBH20s6Mi
	OmNvtVFqTEL/gH1b2uYnk1LAjOkDDEHtyHP5AaRKtpVwqp6/DArOz18gd13E1VXM
	BZomzFEyE9zbjTjMlUO8JT9BEYpr0sOV9SXWQrWY0XudAK8ARzpmFyA+Pg494Ror
	L7AQtgGBHxYx9ckrOr6DSBXrzHBP1Ub560cTqF+A==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gv2e03-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:29:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9JUwM2758886;
	Mon, 23 Nov 2026 10:29:46 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3q4h6bh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:29:46 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANATiNe18088198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 10:29:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC0B12004D;
	Mon, 23 Nov 2026 10:29:43 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E8612004B;
	Mon, 23 Nov 2026 10:29:43 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 10:29:43 +0000 (GMT)
Date: Mon, 23 Nov 2026 11:29:42 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 4/9] arm64: sysreg: Don't run the end-of-file checks
 after an error
Message-ID: <20261123102942.20959-D-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-5-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-5-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b04159b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=1mLOuDP4HEnsexFxJPEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MCBTYWx0ZWRfX+gqS5T9VCa2z
 b5Ejivfb91ZNufjWnJiaHIbdMEhM5sXmQZ5PrLT6RqB6pRutX0d+pJNtJhklGKz+ETZXZ4xRQb7
 AQ9T2J6/nJfeXllaL6Ksf59YNCMh7Ac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MCBTYWx0ZWRfXxgKGLwCf72tF
 t2GhhH7Dkxhmb47kTJ1l7Drvk+QdubBxlSJL84nFlvYNE8rpdWNxqNAVvey9VC7X2m7P9ClVmhI
 b4OG7F9JtVsZGFO21SNZ5zV4mN+hvBGm1g+fCBTkqRky0bh/yERqNFRGwIHp3oe5yta1KdSBn2q
 mPRET7vjUmYcgI91jYq+TG44h1zn3HHCkQWbkG/tyANJ3FBCUjroa6J2ybZ3IXze5LtWS4htpg6
 d3mH8ieiXECbdPV8btlRs6MWal4zzLci6t/skMzEr4noGTqViWEd9lKRbya+jP8XVdlAaJz1Bzo
 fxDyufuZ8t/GOWI7D6H6dAvMrGf8OUBllJVSQDpzb+gBYXn0ozo4AcY+9f0Unubt/HdMQM312By
 Y5es5Rzt9Wmn48KkmuLlfB9SmtFsm5RjGbbQe7SqZVgNhRCzasZ2m+AgrfgfqVZbQZG5x/ZmVR0
 lZlV3ghq651E9vgHLHA==
X-Proofpoint-ORIG-GUID: ywVm4SMuza3a-wgiUoPibiQLEP6ABdGd
X-Proofpoint-GUID: aRjmWk6ks2KIY80Ql4HcjeHQO7Y5oCqV
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
X-CRM114-CacheID: sfid-20261123_023000_389627_B4BC1A53 
X-CRM114-Status: GOOD (  14.61  )
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

On Mon, Nov 23, 2026 at 07:52:14AM +0000, Fuad Tabba wrote:
> fatal() ends the run with exit, but awk still runs the END rule after
> it, and END checks the file as though it had been read to the end. An
> error inside a block leaves that block open, so the error is followed by
> a second, bogus one about a missing terminator.
> 
> Skip the END checks once fatal() has run.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>


