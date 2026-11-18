Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D7C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TDYAaF33;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXWe90Yh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdhNgOMY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=; b=TDYAaF33Mlf4Mr
	lBxYxjN1vsKeHqQdjjMSuCz/Yc5G1xYpRVEl0iSOb0k1QECjaoypMH5rd76DcBDmwCJdjp3Kg4jFk
	oHrES5ZX8wBYPRcwrPOVC6Z4LkcZmtmlmxCXHOUX+D4LPob2E4nUC0oDDMRIUY+igObR1V6kcNM0t
	hXwE6ekt34dtMUu1WHyUohUL7IWlCHobSxvSXZRBnBvDHTqIu1z8DOBGZwNXDqg1Xqhtl5VerYi7U
	rwGVu64KKUkcDsD/V/oa2vv33tyChIgMXuUJQ0k6PByyDdQibtLaPY1LKH5AY9yji4lADuQ2C2yDd
	tQlwj4AaxBU0KFsFACvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeTe-00000008o9a-3Tz6;
	Wed, 18 Nov 2026 12:09:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeTb-00000008o8X-12BS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:09:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkqbV3200085
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=; b=PXWe90YhBRCaXDkh
	T269VXdOqRgbO9IpXhunYqlQ8H9+L5nWJr3u3nG0ftsbFJl2HCj5hQhslXSgLF1y
	IeHpp1ZemyItj6c60oPEm4sC6dgb3aMpMn6bZiBYNA5XYqVoO97qQWSHszVpyRrB
	9KHpCD4S9y2C6pstw0vYEf2jtBlTK5tF4YJhgXG5zXCc5daf3ZSvEOuD/AbD+WoY
	biCXG5q7zDmDmSWoYmCZQDxmf3tl881/GqUmEHj8uN08wxX0f+90ARBN5yC0/Xsn
	BsLt51qqDAJt343zELgFcTrmopyB7FhH2kweYJUtMtGzNGQQO92EUdiexldTodq6
	KZhXQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jw56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:09:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so243883285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003762; x=1795608562; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
        b=TdhNgOMYXpdbFGA8Yz/bpXdZRYv2xRK9k8Sm2bBSr9AtuqdH5r94vh9FRNH+oGWcKq
         U58ac3w5R/Ttlem4v/0ncZpgUm+707/rBuceuIhTSyxQ3J0MK9+YNfTRy8MEOpp2Q2B5
         kJYxNZpJz2DREhRl4SoWP5myppygJbjFajFaFCFD7ivRxM1xwcM5eSGNbJRo7wQxAUYm
         xMmM6Aa/L76W+FbURG0IFe9sGAQoABIVwTWBKS56cUCMmGHakY15xm5IIMbnQhxUp7+O
         0a3ClmKv7QYGSAyM1dzxA8UglGPrmePyQGRqONfkLdDndQmbGhZR35/lhJZP7HB387lP
         bvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003762; x=1795608562;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
        b=kZcV7shSX+btGMlqqVvirqFRxEdK+JpMzdtMLCnSszttem6Fsf2xS0D8mHq22BPBDl
         a8tu5HagbuiGUxbnVnEZ0pUT5li55JiUxtIXwEUaFFNh9Rj4kQ+jT0i0NIympZkAUbp4
         wMNtVY78l7j+lSE1nkBhoMQE1HR8DyQJu0ppBEAI/BJ1wN+wkC/7nj34KHVn2K3ItaCK
         beGkPOS0hno6I2Q/hOeFrQo2V8Od8JMKXnJljkQw0sU2Ktd+rsQq+TUoEwocZ8EjU3UW
         2SxGERn7PmirrdGbNo/jjuKcGGEa92KLBx9OLp15CFZSD8IKRn6XgEGrIs4iPmFNu0V1
         W1WA==
X-Forwarded-Encrypted: i=1; AL+hErF2SLCaKHfWm39zJIxpvS5flCUHBB/Q2t4f7TT1Zy9+cEJAPUsV3emf9L+XTDFjgZ0erLZWhWvoGjKYM/ylJE3V@lists.infradead.org
X-Gm-Message-State: APuU4Z+2JRNUlvGrwjVMBf2fxq/A80YDLHokuH7pJT6K++KURsA8yBwp
	9Nhia8FuV67K6615MdtLfzr2hXoGgBMh+dKLw/UU00jwY4ITo9S29gZi2udUY8VMyl8uSw6qctM
	VLwyo73r5HVmlwIlN7dIJ65VFIEv1kH1baxUlZXyivfPdxD/mptBZI/lNFD7McXe3v0QtEGLcSv
	Vp6g==
X-Gm-Gg: AYBFou20vDT6y8ftrcClK5BCbhu+gvgdrRvfp0isYqAS6b39tnWAuhcStWV7KFJGU2X
	SXORRHCyR6F4lVH6X5SVxYLz7WuP3uRzzU95nzY9SL0+JwMj/SIbFGmeNYJbPjVF3jk5rVPo5lR
	mRPEJMNkv8iMUgGae4hf9iIZInEoR1EQ3E4F/3BzOsN5Pruew9q6lSHq51gICB96qN4+Qr+hwh3
	JHRaizxO8ZB+dRKaJWgQ1gCKHcLdRp316TNn//fyClF9FsRcZ2LQpMNkrAaqCjd8uDfpe96Ka/1
	JChNpD/4fB4OG503r2mFvZAr6U5JVAX3n1/WFpW+jFZ60f0JXeVVesW58Yj0yNWxrWmYZj6uUbx
	A1fSs9aD7N7pLD90hgbVELjoblcjCy1KX/VyiNlLMMJqkhElnjIi0YT3pUVmU+urDILhj37uOtc
	s=
X-Received: by 2002:a05:620a:4381:b0:949:7b2c:671f with SMTP id af79cd13be357-94999658ae7mr397173185a.82.1795003761697;
        Wed, 18 Nov 2026 04:09:21 -0800 (PST)
X-Received: by 2002:a05:620a:4381:b0:949:7b2c:671f with SMTP id af79cd13be357-94999658ae7mr397166285a.82.1795003761030;
        Wed, 18 Nov 2026 04:09:21 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d001a64sm63760025e9.0.2026.11.18.04.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:09:20 -0800 (PST)
Message-ID: <96e3cc39-d10b-4743-bd9a-d683a91fdf34@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:09:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd9572 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QXGhswp5__15x8Fhz6wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UfJCqfG8YxP5rXi3U05QSMIFcNn5Pjqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX21aoHI/CsUhk
 IKkrZK4vJink6UP9LoJSFwVJTXIQwbebZLPqYhqnOnUtSNb2BLBuvnAQa217yZ2jenQ6vhoNQDS
 NlR9fFtqIBJ4MAPUF2L6VAN32z5NB4swihg1TGtMuTIEw4cufrkbGzNjKrLOqnKSDoHYK8vHeJW
 KYfDEbXkZ4a21Ort7js7W7YdE40xyR1hudSRAPkbReZ2ZlXHwkUkSbK29333e2Q014F+DfRjls8
 +/3/abyBQjkHiGmoRxEOHv6cm9tQoEGgLC7bA1e8Lf4GxmBZDKT6dNHRGSfxXiUqsKStWmiK73P
 flNI6ZDV+PJual4PhQEtLYOxQuFPKzfTAylQKSY+APSx3+P4IZnd7QnXH7E0VDwmG/iTcsJzF9N
 Mk3eXmtt8q09oX8Xk8eqjcla1rIBZmFeoLEvBwSAHlowdxGDcx4nWmhw+3pqilEm42tpXk3JOni
 XmjLOWfoBEJoRvM7mhw==
X-Proofpoint-GUID: UfJCqfG8YxP5rXi3U05QSMIFcNn5Pjqn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX0yWuHyKPZw9x
 YWDAV1RCc7nVLFcuOgaIX3MyS6IU8fj3gzaH25EL/O9gyatFZqumG5+cLQEQIvH/UW3Nt9C1+aG
 n+5SAZMU5tpS+zZPf4MdvuwxKg8IxGw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_040923_289518_11C4BA82 
X-CRM114-Status: GOOD (  23.83  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 15:06, AngeloGioacchino Del Regno wrote:
> On 11/17/26 14:05, Krzysztof Kozlowski wrote:
>> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
>> approved by Devicetree maintainers, because they were never documented
>> as actual ABI.  Drop them, because no new custom aliases are allowed for
>> years now.
>>
>> This might break users of this undocumented ABI, so these should be
>> updated to use only documented and approved ABI.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> That'll just break everything.

True, almost everything. I suppose few aliases are not used, but rest are.

Well, it's a start of a discussion. :)

> 
> I do have a mediatek-drm restructuring series that is partially resolving this
> situation, at least for some SoCs it's getting 0 and 1 hw instance id dynamically
> recognized, but with some caveats that could be unacceptable (as in, if 0 is
> disabled and 1 is enabled, 1 becomes 0, so it's not actually resolving anything
> for real, it's just making it tick right when stars in the sky align in the
> right way, which for some SoCs is reliably possible without side effects).
> 
> In any case, all of the ones that have only instance 0 (and all of the instance
> 0s) can be removed even right now already (still needs some testing to make sure
> that there's no regression), but everything else can't, at least not until the
> whole restructuring thing is merged as that'd break things.
> 
> Worst part is we have two new SoCs (MT8196, MT8189) ready to be upstreamed here,
> which took almost a year of development... and it also does rely on the aliases.
> I was in the process of slowly cleaning up those (as I said, there's already a
> restructuring that makes things a little better in this regard), but at this point
> that'll need to be done with the highest possible priority.

That's unfortunate and still new DTS/DTSI should not come with these
aliases.

Best regards,
Krzysztof

