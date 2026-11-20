Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB9606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PTUtof0l;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B5DXBemK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PvPx8KemO0xcM9BvIjOEVvpcXVwQS3ehLVp+q+/Y12c=; b=PTUtof0lODxchJAuqtoSVRSAjW
	Kck1alPMypcuzFDiKmz1YkKDTdKxGgRPM8HcZNLbTeI+i3hIVO23cqv6lAo9iaQZLfi/H+f6PzHYC
	D8LcdknpO+KsRDMKwfBpbHknno8yUszuPmA0slhNtvOMFqbZ5cNAvCXM7EtsrpW9/SIIrij1kZTJA
	ZHE0nv75oyj+ZYRzxqhAHRd3mHZnFPqo5n0wbDau6Ou6oR8bfvWp4zdTPYVt+iAJiItus7NetxyYW
	PU/DxoFpqMNwVoVwrj47vS3HlC+74izbjI5/A4GtXWjooZpI0EbNd1ZShwtFMb0BY+qHjNdiqXNYq
	QbKvuxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPNh-0000000FDuc-1WUI;
	Fri, 20 Nov 2026 14:14:25 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPNe-0000000FDuC-1PrE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:14:23 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAueo32861278;
	Fri, 20 Nov 2026 14:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=PvPx8KemO0xcM9BvIjOEVvpcXVwQS3
	ehLVp+q+/Y12c=; b=B5DXBemKh9Lh8Rak/aftkySB8nUn7NsasM5g/+jda1/202
	SNHoaGCp4T50AfG5uoLucmeIAlvT28FDySN7p1NkD6ZtwATMuH03SW5Q07GNENBL
	LZ8crLwhAp9yp516a+PR34CiZCkRsP1Uzum3VC3B7DLgM9v/MJ96zLNFPPuer3MJ
	EzzVOF0TcZzPwB++1501FHuJDNsHZ1mUAKrl8Wz5m6WwODC8ajQQvRUHTNfQLbnV
	D65Zv3Pw8HNWgu/r8A+wSIjspJXowyQ/dbRGgq/UWQbIwNf2dkuwF5eWySI59VZ0
	ecI6tQDSJ7Zbd3DNa6/jIzSO/ax9WVj+5PFGXxHw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105x8hq4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 14:13:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKDVBTa1220811;
	Fri, 20 Nov 2026 14:13:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j2q5ng6nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 14:13:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AKEDdaU47513900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2026 14:13:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDBFB20043;
	Fri, 20 Nov 2026 14:13:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B608F20040;
	Fri, 20 Nov 2026 14:13:38 +0000 (GMT)
Received: from osiris (unknown [9.111.86.180])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 20 Nov 2026 14:13:38 +0000 (GMT)
Date: Fri, 20 Nov 2026 15:13:37 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Andreas Grapentin <gra@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Nico Boehr <nrb@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Paolo Bonzini <pbonzini@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: Re: [PATCH v3 01/23] KVM: arm64: Refactor idreg caching into
 dedicated structure
Message-ID: <20261120141337.222720-A-seiden@linux.ibm.com>
References: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
 <20261106-sysreg-v3-1-75e95980fb10@linux.ibm.com>
 <87ik1z8gsy.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ik1z8gsy.wl-maz@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ifAOkSVLFCM3CzBERqJcC9NJg_rpimD7
X-Proofpoint-GUID: ifAOkSVLFCM3CzBERqJcC9NJg_rpimD7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NSBTYWx0ZWRfX1grFYOpSlxGw
 8U9gaIC7JaaXQFyArTP2A4hWJieHkkamYfmrPYx3g789KdPdqcGyBy/D//k1xZUO/aKYRm7wd94
 Ku39vjASwOWmvQOP1BiIQYSMpAUaNbyY8cGOnYjdniXsPxKNBnpOpKq0IbNmOjW7h+mOMIFqlZ2
 D12fcqRyN0Q8Dzpj8uJsm81mAiWtP2HGXzHwX3OfxYVDev84qTYQIpoaWWxXpALxsgvrJq2feQu
 7Y2foONElooJcrbPU0AEp8si+PAHtwolJRuL0i+rxnPZ3u0oYpRL6JFfrFEQTKkA/Gpyojc0CQP
 Qs0WuDmgkafbkyu4WHYIPYbPbYBtDgw3G4s+VhNuZ8c4vlsihN57gNFQ4mGErRqUWeOOsPPwxCu
 T0zJosPU7KFjQ8NQWg3bsRtOp8XlW+gn9R35ybhBCRVuPDgOP3/TWmIq7PE3KuASaFl27PvPeYB
 YH0n81NxFpODIyhAqMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NSBTYWx0ZWRfX7PEZIeKNrAen
 Ko9rFLMVrRfFLFVd1IbxaNDtLwwIRNzqqlwdxybsCQ/kVtWEXSxjeCUfFIm6G/pC8kyzqQzy/4L
 MjqKT4QezrVLsftKJw8+LmRsM8tmVwo=
X-Authority-Analysis: v=2.4 cv=K+m3jCWI c=1 sm=1 tr=0 ts=6b00559d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=5Px26FCybgXTlaf_HfoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_061422_500972_A745870A 
X-CRM114-Status: GOOD (  14.84  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 05:27:09PM +0000, Marc Zyngier wrote:
> On Fri, 06 Nov 2026 16:07:34 +0000,
> Steffen Eiden <seiden@linux.ibm.com> wrote:
> > 

...

> 
> Overall, I'd like to see a first patch introducing helpers that the
> code uses everywhere possible, then another patch that introduces the
> structure, the renaming, and changes the accessors without touching
> the rest of the code.

Sounds good. I'll implement that.

Thank you!

	Steffen


