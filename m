Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A30606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tRryluVb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hDZm8brf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJhB8C3a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oeJdmVSOtPrls9VV3hInHlrjkBSr2SzdJK8EBsZwZn8=; b=tRryluVbdsFFdC6qRBJVaSjRVp
	wFe57Mee8q2hJ+nORgZcj+8v2UM4B+W7yBre7+CXbAr6TnO5erAZ2zh4PeQ7C6AOCcScK1vMTI1AG
	ZyK1exfgHR3t8diou3Gpecx8XfLZqQmJ/jQkaw+gFKrGRw9RNSY+0dTGc4JpGDKwwyosajkkiA8ok
	S1J4FIgTJC9IxBTmJnFydmSp2dzFyHmrLxcPasYs2zaDGFwtfn79icSgLlcoZJh26ErbHaNPv9epx
	S1prZ5PO9PNAO6NHWjjl0pplINzbKs2S+LaWuseXcupZSGjZTtL/EZ2rBtwZgSDwa/tyhzFFpVVBq
	o/EiZNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRpx-00000007F8I-1GFh;
	Tue, 17 Nov 2026 22:39:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRpv-00000007F7P-0oc8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:39:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMb1Ff1486940
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 22:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oeJdmVSOtPrls9VV3hInHlrj
	kBSr2SzdJK8EBsZwZn8=; b=hDZm8brfDki6OyFVnujj6+gLwSIeefkKkAA1cBmD
	93fGL5ZAKYRFPNU+QH2yajp3262YCH/oEiWsqvY1WdthUf/kplNWgXR98cuU21DG
	0GW4HwR/7OjrXkGPi4/UxQe1fZmVvMazN5IZIng5UskLw6oB6CSd7LjdIL/Wy+r3
	BK+Ajy0P5zBBDTo3jaMappEPOx037W4KIVHtwYSFH7kQ6s0WOSEWGICfbaTL1JiR
	oRe2biZxnMES52uAyIcRSFqFwXOkUFUtZtj8r5r6L5hJhEjcHgXN10uWuGw0LZct
	61e8kmiTLF6Qe4sj4cUQkbRiWwlSeAhuCLd+zWyaMD8WKg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8g0d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 22:39:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso1330321eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 14:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794955173; x=1795559973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oeJdmVSOtPrls9VV3hInHlrjkBSr2SzdJK8EBsZwZn8=;
        b=PJhB8C3akl+eVzjHxQkVI17g41x8wRb38qQs1yhx+ZPLT3ONKSraAT+FZ274EU2Ohd
         vQx/xXhv36RKlz+ipIV9zLaBBwIMnC+0kI7lskdL8StXgqdEIq3St+GkPFRS/pXnqda7
         68Mv56s8UTlyu/PNWyYD91/JBsiV3HPUtFeAeW8eHI8WK1Z8p1ghoaB+tAmARokpTied
         vZkljRnYjzENQfbBmZykSd5gsWWZuiih3AZQaClDCO4QBrAUwzqVujBGi51xq29qOEXQ
         rBvQbM1/L5GZNfjA85ibMmD/jxdAynUEmf+FUnuqz1XjZZcucYTjJ5xM2vJo4bZwOjdr
         GPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955173; x=1795559973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeJdmVSOtPrls9VV3hInHlrjkBSr2SzdJK8EBsZwZn8=;
        b=NQwYG2UU3o97Hg8Tud9A9VtiRGj577CoAfIpIsrGZ9NDZSK/VAhnaatT4CpS2/UL5z
         /3U5Z2txSICvg00nZWlGbebmU65XTYH8XyrUDSDS4ME7FSzXVzWDzdeEjeObUidJKTph
         sItuklg/Ebmy3koJbwu1gUxZr4mnlf8N+hP/14+IDsoWzJ2sRgyuJlQuB+IIPqGcx5zL
         uLjklj0Jvvbmr18i6biC80tkWx0Ydom/rDiwtYbX1hVKuLn2UDCRjlqkDasy/+u0Vugp
         vw1bYG8siN5p2EBHXMPCVudh9ostBhr+SswhPoV7+79HMfi66AqNgVv7AMC69cDgZOD2
         sekw==
X-Forwarded-Encrypted: i=1; AL+hErFOBXnMYsKWXEglq70pprOgiyffxUc66vOx2kbSY8tl4ihucfOcXYYAI42jrwszSxhLxdYWKGVpjfzBlCNvqo4M@lists.infradead.org
X-Gm-Message-State: APuU4Z8kDD9S5reY38WZBedpeXpOBoORCqTKDRAicYRqTqPvZQhFgcO+
	T1tWI1jsd/tJTilz76bN1WD0hDGcUvJy+WWV1SjlFL2mivKW9BJnpPKHHKISHMNqXjvPCmZ73Bt
	xVLx3tBNYRjRn21NBteJ1Ml1e/e1mwlBsX8sRhydmGPdLe7GNgZnCv/rA6iG70rMoiZYVvdoQDa
	cd4sZPXexyVQ==
X-Gm-Gg: AYBFou12Ry3OLP6g1n4qiD8WQwIRHf0D7mxDP7tpymjIMFhD4qTFgPzO9w/sluN0mkV
	EDjTjj2ki8qrUoo8WvwonHw8CSUWl9H4a+WFY9AeulvJ4bBrYN2UMRZ5TClEKsFuwExQ9mVatn2
	vz1b8xmQRSAKzx9iNWGKtuD+qAyIfgQ9k0VixdSuE4cAo8rwf0t16ZymS9xm1KCLe8wn90Ug66l
	INVWHfuhk9KDANvX5EQ+8ZQbvjxXDPC6R8qI8E2PvmNBECHUylwJL6KpL2+RwoDfVl6SP0zgIyy
	f+za84GLe+TmAkeKmPDFT3n6FxaihYRLn3uN+2HRH5Qve3eZ0UPF+LHWtuv01cbWHdQK+oLtmMh
	heX/qhyzNCqQ/OrGYeQmRcOEHEU6PJzVH0ApJaP6DQF51hasQY9c3t3q4m/FruADu5Ms8FkBYDC
	yD8UEgYNfg5k22L3KMRSTbPg==
X-Received: by 2002:a05:701a:cc93:10b0:166:862b:9bcc with SMTP id a92af1059eb24-1b543cffed0mr906203c88.18.1794955173014;
        Tue, 17 Nov 2026 14:39:33 -0800 (PST)
X-Received: by 2002:a05:701a:cc93:10b0:166:862b:9bcc with SMTP id a92af1059eb24-1b543cffed0mr906172c88.18.1794955172419;
        Tue, 17 Nov 2026 14:39:32 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm1203653c88.3.2026.11.17.14.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:39:31 -0800 (PST)
Date: Tue, 17 Nov 2026 14:39:30 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
        Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Liaochang <liaochang1@huawei.com>,
        Radu Rendec <radu@rendec.net>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
Message-ID: <avzXou6jLGuZYTDp@hu-ashoraj-lv.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
 <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
 <avtMA9bb9vwezquP@hu-ashoraj-lv.qualcomm.com>
 <avyfjl6ZLbpilWkK@hu-ashoraj-lv.qualcomm.com>
 <87h5hf8b5v.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h5hf8b5v.wl-maz@kernel.org>
X-Proofpoint-GUID: DZvcNhNDCsS_sJ5IOfx4dYr7HcRKvfDt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfX2BvVJVGTy8JA
 tqo1aWDyWQCQ4jnaspEjm1Ht1CN6MYWgKe1paaaHIjoxMSZ6JvlwCeab/X9xfG+yb5xVqDbkPe4
 z06gcfBp2pqLdJmgUlYDsxvccahGVrc=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afcd7a6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-shGApArVcq1U3eIPRsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfXxDLUJoi9IEDR
 sR7uZlnMX5sdDDMzPB76V3zP58MFY1nYF46kVW3+ZpciZI+QAVJgkuHDwUnYGXwpnbmwJ2u0/o2
 Fb88lTSvTAAbtpVuO2ZxLfjoos4P07aH9Rnie1f2kBCYum3YrQ9iFeAXzJB5oKAGzvkU6AIkpKw
 gzN1eCPWe9bfrC/TfCArRAWOyJAk5ns2a9dEA18qBW3Ky22lik336TN/iCB1zsRVvFk7f0a0JSt
 ZOJMo+MzbhQuiEYVU7fv0mKHHonu6DXAUpNFg3o1E0AUub1WdixLMQ/5upDCU7DMNzpMytQ3tJ+
 9EzlQ+xDohZSc7ryGvblVl1LdtAckC1OJkFzeOgdD0bSfO4aEbtZiZakOkxLXEM57nnxskbioa2
 w8kpdgvGTbxbG6tgniTKyDRhu60xWqLiLECljlEuxaDSw2V7eNfXHs3zQw7YM7fUJ26EY4OCZnv
 +Qn+Nj9uwXi5FyjviTQ==
X-Proofpoint-ORIG-GUID: DZvcNhNDCsS_sJ5IOfx4dYr7HcRKvfDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_143935_361352_CCAEFA19 
X-CRM114-Status: GOOD (  19.55  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 08:18:04PM +0000, Marc Zyngier wrote:
> > 
> > I think what i quoted is true for regular interrupts, but NMI's there is no
> > IRQD_IRQ_INPROGRESS serialization. So that overlap as  you quote might
> > be possible. 
> > 
> > I'll need more time to stare at the code  and rebase my RFC and post a
> > coherent series that uses it to get the full picture. 
> 
> When you do that, please don't mix functionalities and tests as you
> did in the first patch. Slap the tests at the end of the series
> instead, as separate patches.
> 

Thanks for the tip. Certainly!

-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc

