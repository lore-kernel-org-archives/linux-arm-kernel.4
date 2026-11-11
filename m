Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53041606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vB2qv32Q;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDsyaBpK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QA8X1iVx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8yGp2EiF3aDCnqlqi1gT7jBAnRSA03R0R5GenYCaNDk=; b=vB2qv32Q8vn6LWeQhuw+fc5b27
	7og9cZBhFUUmKIldRqUUmn6Z1MBtm4yAEemdRiCgec4Ko3UawEbyTaULXjNPWvQyDxzlqnNFUrILW
	l+gs7r1CUldFLW1cdiljrvFO+4GYHnHK1y/pjt8lxyXpHRJC9oz1R7nQkA3gQtHrNPLsaBwnAZjiQ
	cP7trMQWFk5OT2kxcnCRcFI7/n4sZN0VRN4GEHzpq0GRRJpm2mvimeDAYkJ8TlomZdpn/qNJUokH0
	cE+6jf13rkpWsb4HJah8z1vV7zKfR3PILwlUwoAHUSzrmVset8m/VN5y6XIu8M/U/3s5X8PesyRLY
	i9MnyG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9X5-00000006zg3-0tYo;
	Wed, 11 Nov 2026 14:42:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9X2-00000006zfY-3bHt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:42:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJ6im527402
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8yGp2EiF3aDCnqlqi1gT7jBA
	nRSA03R0R5GenYCaNDk=; b=WDsyaBpKuxyoqXbOhgBk/TLIAtjDr8VyshohorLn
	P/XrvR+OcvFDa0NxXZ+PtLqpiPq0OAJXSQXGj306O1Q5aa9ZYVJ/Gh4g7xdHlMdk
	sUBGEdpOT0W6/xmM4yJ2yxTYqCIn7cxWqqgfAc1jF04K3U/m7D4ToueyeyG1NP+x
	QAg1bbYXiNTesjWAdNn6qchCZ2e1lusP3nrzlPLKArQ0peiBYI5vq7+thAnYk+mg
	KyWcu4uFHcD7CkdlCPyTaBTQFKAVIS+DnaSP6kXWe7KSboyBGfI6476B11f6oyU9
	JV5A6HLIpxtWcxMgjbGmpXfU6FcXBVr9NTTtewCi12qcng==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjs0n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:42:35 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso1243942241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408155; x=1795012955; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8yGp2EiF3aDCnqlqi1gT7jBAnRSA03R0R5GenYCaNDk=;
        b=QA8X1iVxX0GifOJWiZTjK6CyhNwpjC6ps+1A0rhP7TWlBgLBsz2dFxrQTPvBnesA3J
         N1Rd4pcu2fUp3aY8pm/h6chaYfOU1l76CBNY3CQBoNOAXvU5XwybqfcE/XoFwwTr3f77
         P+KV0Tq8T/EaCjaRjo6vMRTI5RQbtR+Dt+iQNWfuieTzPnObR1VKRJUvqZIop5fZPGYR
         zEK+49PQZY+qe93Tqsf9y9A/fgv3KxNWADVGvt/WU/OcJ1K5EqFGjLlf6nTEC1Il+uGP
         Ok05HIHKwD2lB4ya01Wfm8WpkqBLibxNAz8SqM6SG1WjEDdYbgJ+HdkwTlnW4Llg4RbI
         bcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408155; x=1795012955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yGp2EiF3aDCnqlqi1gT7jBAnRSA03R0R5GenYCaNDk=;
        b=awqitCJc02H6KD6ZkoG4E1PCyb5CmKPYW2u+kDFC7T7s0a8/8vBtl7M8GDHk97RP+6
         y+fsv6J8Ia8t1/O2oDij0pDoTDgjra7pzqTSuoHItvhqUuS/d4ZTi7x5Dn7eNkeMLet+
         uvJCOdjPXYrRSLBcq+3KrvZeRBvJ6TSirWhwTbLjtB1zyApoykL8CYoesaJIIS9H4eMA
         BnTpaU2/BwLBvHO5iiUrYk1NWIy4n+FfKonIhpr5jeM6yNPDtCqs1MqTeSbjYcdLIKdx
         ZI5KMY+E4JTClD/PTpusAEDMuVemnOYqqa+xrIm3OTEeWGdEKku8RItJcGTPaJwSihi+
         pd8A==
X-Gm-Message-State: APuU4Z9+t029VCZ7jeKBLQZjHgBQOVKk0euQ76BStSC+ewCtLHrEfBso
	x1KolUZgtkB1waidPpo10k6hl9EhTPvueqRQB2eEGJSgGsUJ2tTkEwlnpZORtSGRsIChBwcoZSP
	Hvz7IVoYP97KH4n3nJoaECwfhHTAmDXGuPRtxtG/Z7DimZvj1o5LvJWfcdEYskGPMRYuy+wqvkt
	oQdg==
X-Gm-Gg: AYBFou1cH7yUoZIMs7TZp9mcfz3+r7uvCIXICAtJJ8ReJGX68jmWjk1tgtA+UACZoD+
	9jyJBQ9QFQkhHyltd/fHVsKh8cpY5FHdi10WU17iERmoUf9hQa4r2sX0skdVxxEQez75KpVHnDe
	CSa0PNhGthCMttcMTftg3l4ENzHcAYpoRsnuL4O+740wDVNfnkR6UcDQd9MfWINEOURzj63v7LB
	GRWJdtn2hLVZqbMoXJS8eZpvOyIZV/ZRXqzse5Oh0GfbPovF6co9JZuAdkyHfLsptMDSGFMTIfa
	TWnqaAmC7g9ukDtnTXDHcQU7DBpfJs8wAe9fQjyRtU8/0SOe5QkHIndryTF1+UsagV9LRGS2ahf
	9zks4+nr1fyhRkyJmYvj0uqU39yE44o2IpAd0Sm/IRPcNHGumUIC2GbNAwlzpLI1T
X-Received: by 2002:a05:6102:4193:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d50610f07cmr840871137.34.1794408154891;
        Wed, 11 Nov 2026 06:42:34 -0800 (PST)
X-Received: by 2002:a05:6102:4193:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d50610f07cmr840857137.34.1794408154202;
        Wed, 11 Nov 2026 06:42:34 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5553casm721825e9.14.2026.11.11.06.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:42:33 -0800 (PST)
Date: Wed, 11 Nov 2026 16:42:32 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: c630: Enable DisplayPort alt mode
Message-ID: <ctgojjsmfqlc57i5mj7vgaprp6okjp73mr55bmq6og6h7t2r7d@zug7c4oy5q4l>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-12-ardb+git@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX241TKr0+BNrJ
 5XwNK/yOrgLJrAaS25j10/jAWujoEctHBj/DQz9zXjjP5Qy8h1WaHed1KxeMV1tBChc3bA3lXaj
 P0BHDc046kGB/jFIvae3wpec+Z5GVwHlMPierS+ABhf7HlqOhH0PuS1XNFRr6pj3botEAiK5F+o
 idnPIhMW0y4+P4ftSEs6fuXkHQdcLNvTK2FgKisdUDVl6pxCypg3ud6equDfmZq9Wb2igWfrYnG
 MJWAxj3eKZ8QipZaqLXX10ESdl0Q6FXj6u3FqN45CIPUZPE7Gy+s8w2JpQXg7unA8NQfpbX4JJQ
 yjRh86BWpQgRfATx8gUKZKu2TS214HEUD3IdAWkqh4vDU7hWYcvxrXqF8Xf2DwZpB9aS+xxtS/5
 RRDSAQEdJxg7V5GKwy+H0TA8yK7uzmZ1TXBh7d3AmiwUs43SlNuvrro+fOgSbm2JuaqyQcpe3nS
 pzgycydzm4LhkYMWJHA==
X-Proofpoint-ORIG-GUID: ecrjeziXZPfSpumH1zUQM6BfiB320LLX
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af47edb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9zJdjf2rWlLw6iGwOMIA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: ecrjeziXZPfSpumH1zUQM6BfiB320LLX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX4xOMno566rB2
 FquAXufkDaG1Tkx9u713gr3kA59FbUb4KE+XjLPWT9EX0Af9soVYAxtyu6rE2FTVM3ONqN0/aw+
 Q674lDaH3RPHS6oHAsFWwnjLh46CYic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_064237_012931_117F76C4 
X-CRM114-Status: GOOD (  16.68  )
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

On 26-11-11 12:53:07, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The right-hand USB-C port supports DisplayPort alt mode. The EC takes care
> of entering it, and ucsi_yoga_c630 already sets the orientation of the
> combo PHY and passes the EC's DP hotplug events down the bridge chain. All
> that is missing is the DisplayPort controller, which sdm845.dtsi already
> connects to the combo PHY.
> 
> Limit it to two lanes. That is what the PHY provides alongside USB3 in its
> default mode, and it matches pin assignment D, which the EC picked with
> the monitor I tested. Four lanes would need the PHY to be switched to its
> DP only mode, which nothing does on this platform.
> 
> Tested with a USB-C monitor: 1920x1200@60 over two lanes at HBR2, with the
> monitor's USB3 hub working at the same time.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

