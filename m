Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDD1606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 05:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aEcJrqzb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlW3FWCY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ko1GD25k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QQby9GvpTUT+9V+n4/fAPsOvs5JQDMYBnqaQpSZhkiE=; b=aEcJrqzbSV+OPnnJEELavQL5LO
	qauLbu10+hPekjb8VJjvOl/t7zzpD6IJEv+8MEMiVKUNszffoH6l/vV5MhACXBv6bM7p4nuZppZ+6
	EselGVF6rqnfTGuz2qs/gT1oc2JELFUo832aTZmBZs4pCXiEqzqmVBI2lAAvi22KL9f9555cqkO7k
	kxXCukv+iyenzKOLW03Fvdv9wQQpZC2eGWop93ImFqHaEW5slQm1rBGkCgt/JjvJybgkUHuwt8/PK
	i0OIuYgkqdowg/dpC9uRGAkTd+16TA+IoVrTIKdBvU0LT/suAJZUV/wSKcghkHRgbGZ57F+2eHNSK
	rNU53WlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5vZ-0000000FTAp-3Eyg;
	Sat, 14 Nov 2026 05:03:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5uz-0000000FSdn-0tsC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 05:03:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE4vl2g4040974
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQby9GvpTUT+9V+n4/fAPsOv
	s5JQDMYBnqaQpSZhkiE=; b=mlW3FWCYjln432EHoZH5WeB+izkulk3ZDnVWN5wy
	fdbaiXxj4fINuwIRcTMGuy/G7bS/zT2jE7yYqC3g++wgVtbGubXFPZcsHOc16HZd
	wUXZUzaMwFzG2kb+fpYP2IrfedSNVgEHtpEqlC38arxFdcIglc3dw9XMz5GsJDnO
	IX+y87MwMVnipqTRcAZu2soQtjSSTyLlaSZKorbAF0czSvluYLiEFBY1TJdi3L/T
	lC0/VgoXLc4D+dJJyu5pIZNvonJesQsP7tiXXLTEBNG5YsH3o5foPTOKl6J70EnY
	81/5AoDNZdIicxvZObpNWqyXI5L8K1jur876Rzf5Mjs1uw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxdbnrh75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:03:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso7215600eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 21:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794632592; x=1795237392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QQby9GvpTUT+9V+n4/fAPsOvs5JQDMYBnqaQpSZhkiE=;
        b=ko1GD25kHeTTnWH9fX7LLZ6b8PTs1EhU7rn65PRd/0dkF8yPqF27SCErdd3kndcA2v
         Vq9ShqxBeLWA7svlmJAc9qtX6gzjgRFNT+aWgl5asyZyok+2CneMWHpeBiQABwzToFWe
         XY1W+8XBvWaHnW8XNVtG0eF/6oVHMJPNGlFTFSqWCqQGZ+K8SbJ75mccwX7KGc9yc2Uf
         2MEEGisMN8USchSbfIc5ZtVuYv/Renj9KM/2dbBwQvywlloU4lxtm1mgQTpnBpcGYKZc
         UOEShTbccKrq+heTX7aWWADu4sF01JVDfHERDfK4JKNTZ+V5/cQXuDZbRI5+5VNdAgjU
         OLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632592; x=1795237392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQby9GvpTUT+9V+n4/fAPsOvs5JQDMYBnqaQpSZhkiE=;
        b=n/Xq9V1CQwGkZk7cWxs3iiQgmrrrbQnELNvMMt4NT2afztG8nm473C3TIsZV9ogpO3
         xdzVvLAhSdoSJueU03YaZZ5gBtCV5UNCjU8WIYYhwF2RyolTEGKhMEhifWBG1eyPLPwj
         IqCR6TEC2k8zLw1aKBWprLQDoJ75B9rrVhZlsMBSxKNPwk/a7WwoOqCsOtjzWTzcs7Zb
         GTHbRdpxsIlJkdNxiH+DWjLBzzs0/2OHIZqyM5NmEtu0O5auyZbZjM52VU0sr+SwzyeZ
         GUjrw1X8MzRaDXYlSnfzTcJtpz3Smenfo6rGFKl8m9Hl+LSd5mmtjZ/i+sjkTLP62bKR
         z5yw==
X-Gm-Message-State: APuU4Z85OXNPrFfnRxtLfFMTvOTXWgOe/Fd30d5QKCXTZCm6or/Xm3pq
	LC4hfF/l/hNBhjGkyLtNYHduOyI65rXEX9XBHLbN27/KC20O6WEcpBHxGTboXFUk1Z87XmW5yLX
	Q1tuf60YZdHIQS6H/6HayGDkrryV84XmN3moiT0GcpK4F41G2NrivLgw33NeGKEkti6OXT3rNhu
	G3Zg==
X-Gm-Gg: AYBFou0dLWyzkUFGo0jLN8GbnDcwGvFNYLADGt75HN4dCLvhgU9wO9hD7GPpHyMfShq
	OJCw8P/Vvl/yNe/e01SgI3Wq8WiZxPshraGnclx2wBRa8o5ifLu7yhxEeWqHlgIaxLsV3DrKdI0
	fX9vK9AwrBOK1XFDFMAqTVKpGvRv7ehY4yOMQUrkiZwVWQN2FXoGG607WhsF2TCkol44gSfzcJm
	gY609H2zxBbZr6/q5gtH1giZ1Vl3O0ZqM88IRFbllshaHIutaIJJJc+ovl+q6p2zV7KJa5Qr61N
	hGM1XdzEdivm628hxE1KUqBN/5q7dJn+8/xOo7s2ku3cCW2AV7NxAukrR/OTcz9rxdVCfoGQFUo
	QYy+HOqOs2QSj9cZkVKvH+CHIha3afEl6+0UwwGez4W6cC+7JM9rtLm7my/It1xx9l8ewDT1knC
	LxvpmZvjMOvJAOkG9NMmgYbg==
X-Received: by 2002:a05:7300:b0a5:b0:375:f846:5b50 with SMTP id 5a478bee46e88-37967316379mr4093070eec.26.1794632591766;
        Fri, 13 Nov 2026 21:03:11 -0800 (PST)
X-Received: by 2002:a05:7300:b0a5:b0:375:f846:5b50 with SMTP id 5a478bee46e88-37967316379mr4093036eec.26.1794632591181;
        Fri, 13 Nov 2026 21:03:11 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm20958291eec.21.2026.11.13.21.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:03:10 -0800 (PST)
Date: Fri, 13 Nov 2026 21:03:04 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
        will@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org,
        ruanjinjie@huawei.com, liaochang1@huawei.com, maz@kernel.org,
        Ashok Raj <ashok.raj@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
Message-ID: <avfriMfmwF2Nzh0_@hu-ashoraj-lv.qualcomm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxOSBTYWx0ZWRfX0XfNJjuh+BaZ
 /1F66Js6p4En9dAfnRyYISwcQY34XDB27qnt+0QYyl5GHWdhxbA3gx/6McT1+OVyHq3bC7tIyYl
 f8UNmeyyruTpWWxEIyC7LART/GcCIvd3XdZboehCMY/Zymn8RmiPTyozsbILD3Bmcl4++JjFoVJ
 6IuGeai+ZIFk9Xpt+xZDsK2Geo+Bz4H5TE0SNt/Edej2X3qQstYbdjF16rRpbxJm4A0VbhXcnyD
 98jkAlGWo48Atx/vmCtm/gsskHWFjX416MzEpe6IPXQ5qfrEHT4Ko1eddZnX3oB7eYEP/d0em6D
 zEcniRbqJZnQxJ4XbPl8z3hYtvZAPkXjKX1vW9AyMtSf/GpKvWhRBPNjSDl7DNNVYeTHA06W7IE
 jiPpytGf8OXEkkAyvlSqsW+tkFw74agr4+uA3artq+8GwEUSbWwvV/31HneOMDia/JUIy4TsF63
 cP871WwdoSfaStXn6YA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxOSBTYWx0ZWRfX9W0W5RJPTgEU
 W/9RcYB+kHwNfTnUp2zn9iTji4HT2xkr5sLKfzbgcdYvJCewHOhHxWJBKr4OWCRACkdchd2QjTC
 CRm1SOyKCMibNRxvGLhSQpdeyi0cviw=
X-Proofpoint-ORIG-GUID: _Gl-JQFxDhqARoS2a4O5L6f7Tw-qgG9_
X-Authority-Analysis: v=2.4 cv=ULFIjyfy c=1 sm=1 tr=0 ts=6af7eb90 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Qo62YIdtaUj8nN3BmpQA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: _Gl-JQFxDhqARoS2a4O5L6f7Tw-qgG9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210313_288997_FCAB4BAB 
X-CRM114-Status: GOOD (  22.14  )
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

On Thu, Nov 12, 2026 at 01:20:03PM +0000, Vladimir Murzin wrote:
> FEAT_NMI provides an architected mechanism for supporting non-maskable
> interrupts (NMIs) and less-masked interrupts (LMIs).
> 
> Since we already support pseudo-NMIs via priority masking, introducing
> another flavour of NMI on top of the existing infrastructure could
> easily become messy, making the code harder to follow and reason
> about.
> 
> To avoid that, this series first makes room for the new NMI "tenant"
> by restructuring the existing exception masking logic.
> 
> The main idea is to separate the logical view of exception state from
> its hardware representation. To achieve this, we introduce logical
> exception contexts that can be mapped onto the corresponding hardware
> state. This naturally consolidates the hardware-specific handling into
> a small number of places, while allowing the rest of the code to
> operate purely in terms of logical exception contexts.
> 
> Since this restructuring is non-trivial and carries a risk of subtle
> behavioural changes, the series adds extensive debug checks to verify
> that the hardware state always matches the expected logical state.
> 
> With this restructuring in place, wiring FEAT_NMI into the new
> framework becomes much more manageable. GIC support for NMI is build
> on top.
> 
> This work would not have been possible without the contributions of
> Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
> them for everything that works well. Any remaining bugs or issues are
> entirely my own.
> 
> Most of the testing has been done on QEMU, Fast Model and pre-silicon
> environment, so the series definitely benefit from extensive testing
> on real hardware (without NMI, with pseudo-NMI, and with FEAT_NMI).

Thanks Vladimir

I have tested this series on QEMU and also another dev platform and they
work.

I have a small change, I'll submit after sanitizing my patch and running
couple more tests. 

I haven't reviewed the series which I'll do next :-)

Cheers,
Ashok

