Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C01E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nevNLwfC;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoVMAZwD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXPOnh0P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=muP6DUXg9dLTYnQcGiDX4DlIbKU6QaKtbQTgxjz4/ac=; b=nevNLwfCtnjLVxn4OIL3Dop6Tz
	gNqHlDMahf6Y5XIX1RrXDwkTB6M0/0uW6gzHJZwnTsGkG+W1Ba0bWZG4iBQqK3kKYIR3uM+8wBl70
	jQ9AWLAdFMuV+bFjOgjBT32XzmVMB8PFU5Ic+b9UWKXaG0Wm55RTQkgA1iIKdBqdBMaLByon1Jfmg
	rm8Drz5qFQTzlOvImm9ccij+x5XHF9j9QTd+xdoJJCY0VxX15RQmKZFNM5qfSU1vqWEUMWTHdCxyR
	oMDGGWJ3/AQEjXLSGCG1RoraCbdbw2kposjsgZ77DmmsOWEW0jEtw8ntWOVFVfbDoQc/HhJo8CZyP
	/buwURIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5rh-000000011qb-0ciW;
	Sun, 22 Nov 2026 11:36:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5rZ-000000011pX-0wVn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 11:36:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM863Pk2968758
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 11:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=muP6DUXg9dLTYnQcGiDX4DlI
	bKU6QaKtbQTgxjz4/ac=; b=OoVMAZwDbDBmoUb8eL+mcd6tZqZuGBWTCaYdmzvH
	a4LczG6uBQdDCngULHnaLsEti630LKNx+rmTtFs/DtrydtD+etmxlurqOl60/gn3
	5HHU2BY5OGxG2VD2QNT6ZM4IcAsQEBWBConkyp8WWHj0heYkBstjxkcNanBWsPcH
	OG/DyLDsLAvsoi8fjVEgRoUsXnrvThzLU+KGKhUdDeFOLRG6iCmsk79EPQZ+qSYt
	PJblJILb8la5oFCW59v4HjjtHQZO3RHoH2RaiBTjKvuKhH19y9LLwsm/kyZJ4PxJ
	eWZmY1U2a5M9ztCfItMRjezgsGRXbsG1FfPJWtTehEIT/g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu38yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 11:36:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so4474378c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 03:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795347362; x=1795952162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=muP6DUXg9dLTYnQcGiDX4DlIbKU6QaKtbQTgxjz4/ac=;
        b=BXPOnh0P7SpHj+Kb1/qVoueDZ7Tpd7qiWrno5XCqnnu3az/rVeB1b9YnA8Eig1/9OO
         ZmPC9WLnYUy1LG0ascujkvticXW47W/t6ZM38VUpdcyZYNH4dxzicU9cjW6HISWFS9mE
         p5471EStBuJpj3Y97CooLpWHt9+ayWlKazJx7UXtSfCo31RUWaw9u6MJD/dq7fUDzL03
         H7EHto+hAIOLMWYyry1+ypqdes8jl6vf9/Sbfs8+UWPxEXN+sjoo360uTQ5sHj0yX6Pb
         JXobTDOSltMigfmQhoSvETBTU/CO//Tdu5QcNKm1NzHy7TfUmszPU/+MKwyQBtroEHJb
         vyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347362; x=1795952162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muP6DUXg9dLTYnQcGiDX4DlIbKU6QaKtbQTgxjz4/ac=;
        b=gyP0/crfiXc0Ai/fajMcC9LNfll0G3aZxE707/rssHc13zBlMmnMTxoAZXgenvmHkG
         czSHkNdF7JMdqY0bTgTc/aI5NPaG1+LwBy0bvcG3zB3M2uobCXhjAY7zYx9EkV4Ka1Z5
         KaJAl2hM4u3R7Vox+CTiJi4UIVvokZLTDpQk32fQ1xmEpx02m5yxEfAMtFePQAjG7U5m
         OKrJt302INQwvSPN2TWUSjCDaOT8dAfm+jbzhUPVBSn0DbTmKVknh/pyV0U2ugASQedb
         kEMmOI9lmtVLhJy8mlwtTjnewv9KF+1My2tfq41X/3SqHGsstnaN2Njt8skwe5WBner9
         ei+A==
X-Forwarded-Encrypted: i=1; AL+hErF+F+6zMngJoYZd2yMHaC7XJaiKXgJnkNX/wldaSpp6bBhLFOBnlDnOWuYeSPQvCmO3hdb0UcvqJCw2X9iFsn0t@lists.infradead.org
X-Gm-Message-State: APuU4Z+QFEmk1Ib7MWwCpoj1TOr3hifCZ/jme4E112fQoGAEtnl6UUoJ
	D4cCS6UDWvoz3ZAy+lp5hlBwZQjqgKXRIWgL1Vnj4pzCOsy96TdfQ7iOAp0LRRzk3dcEBjDXhSH
	ETpqGsnsuoWwhuRg4B49jLyvWU+TUkvEpEXcbJBvqjfHvmm5QK+EdsgCM1pW8y6dwPybiFuYBup
	6nmA==
X-Gm-Gg: AZFdTZeUyh2FJuRC8jCEKk4LDXDFDkohPWhHJ+QxeWnMOvT7bfclUOPUyeZ+lz+VwhN
	oH4AJWdL71aIRcYRsL/r89PsmSn54W1bpiHaoZc2wdfRpJ7g2yK9g2m4usUuk46p2Dy/WHTUVrb
	a/+DZX3ijKvo2KUQC/ta/ELQAulPqNpqdej8rg1bAdjBdskW9ptts+glZLYNc+OdQ/Stwo6RT75
	XAw9qOfprGmZKqG/b9ErftFHmKKYfj570J44gm0Y0DQ4p5PVRzrf0RxWAvyI2a2UYvug9gdSi44
	0ryps5bqOxH/mgaGbJ1wmLwB6w8L2jtbEegIggj+AYHpW/QYWZ6T+/rhTj+emve6ZLpWXqg68Yg
	XMyxOldXv4sCy27P+kqEZ+26knrXpWD7IxEnfPfteyHwsQzxx/4sRsOkHRwRh3d8=
X-Received: by 2002:a05:7022:7f04:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b5566fdfc3mr10202035c88.0.1795347362072;
        Sun, 22 Nov 2026 03:36:02 -0800 (PST)
X-Received: by 2002:a05:7022:7f04:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b5566fdfc3mr10201991c88.0.1795347361468;
        Sun, 22 Nov 2026 03:36:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm23234990c88.13.2026.11.22.03.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:36:01 -0800 (PST)
Date: Sun, 22 Nov 2026 17:05:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Message-ID: <awLTl77S5Pj0Maok@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
 <20261118190745.GA198891-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118190745.GA198891-robh@kernel.org>
X-Proofpoint-GUID: 5SAqEdjKFoLESVw7WWH0juQ1GJvY46Hy
X-Proofpoint-ORIG-GUID: 5SAqEdjKFoLESVw7WWH0juQ1GJvY46Hy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA0NiBTYWx0ZWRfX1EmhGoEILbyC
 DTgZvHvckLo9+YHac+UMWoxlzE51eV+T6wIGa/AOQwfd/1wEIosJCRzMGYP1o0ZBM4HuyMPNvnQ
 DIC1oIMYEquFHFwBa4QsTqsqF+iuORKDa4GBZD83LvLUSBmM5V7FtRDCXRrBOnnlLB6XiUb2L4h
 rLESgLYWiGmba68FxTBrx2+6fjBn4OlcxPT/SQYGk4lhEBXJ6NKuwIrwtkK1MSaW3lf4Ga7TWI7
 Lm9ORsSRU11DO5zO454q3sf9bHUY1ACtXYRNQkV4ZZIP3XCPRND9VnHmR3wL+SvBi7huFlsQA3e
 oEMuqNcWEBdtuqNWDDGsogI3Dkct0Fwq0OW/OgrQGugvNoV5n7gyZj7JVfEuLsyMzBPRyUW2w/Z
 1rmmv27c4v8s0FRn4N9JwpXuPz9uKCs920gaSMVF+3kmQR5eK4XcNA1+rCFF+RSC4oEZgcLc0Zn
 sQyjqJyCen7SKymZWpw==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b02d3a4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cC9zmzg-b8Z3h8VEsn8A:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA0NiBTYWx0ZWRfX1DuUaXRCVl9/
 6g4voQgXdIp+23dMMyjlHaZp7zztJWxmp6RYohZqFhm7iBy1bncAkv1JbyOCRtQeliKoj9L2Kco
 CXPuWyQAXIlVs0ZBK1YAV4vxgmyjcNg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_033611_036975_A8AA8E63 
X-CRM114-Status: GOOD (  28.65  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:07:45PM -0600, Rob Herring wrote:
> On Tue, Nov 17, 2026 at 02:15:23PM +0530, Mohd Ayaan Anwar wrote:
> > Shikra's EMAC requires two additional clocks for NOC interconnect
> > access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
> > OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
> > are enabled.
> > 
> > Add qcom,shikra-ethqos to the compatible enum and use an if/else
> > block to constrain Shikra to exactly six clocks and require
> > operating-points-v2 and power-domains, while leaving existing
> > compatibles unchanged.
> > 
> > Add the relevant compatible to the binding document for snps,dwmac as
> > well.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > ---
> > v4: moved operating-points description to the top-level, and added
> > power-domains as a required property for Shikra.
> > ---
> >  .../devicetree/bindings/net/qcom,ethqos.yaml       | 54 ++++++++++++++++++++--
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
> >  2 files changed, 52 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> > index ef520f810577..6bd4bded650a 100644
> > --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> > +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> > @@ -14,9 +14,6 @@ description:
> >    dwmmac based Qualcomm ethernet devices which support Gigabit
> >    ethernet (version v2.3.0 and onwards).
> >  
> > -allOf:
> > -  - $ref: snps,dwmac.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -32,6 +29,7 @@ properties:
> >            - qcom,qcs404-ethqos
> >            - qcom,sa8775p-ethqos
> >            - qcom,sc8280xp-ethqos
> > +          - qcom,shikra-ethqos
> >            - qcom,sm8150-ethqos
> >  
> >    reg:
> > @@ -57,9 +55,11 @@ properties:
> >        - const: sfty
> >  
> >    clocks:
> > -    maxItems: 4
> > +    minItems: 4
> > +    maxItems: 6
> >  
> >    clock-names:
> > +    minItems: 4
> >      items:
> >        - const: stmmaceth
> >        - const: pclk
> > @@ -67,6 +67,8 @@ properties:
> >        - enum:
> >            - rgmii
> >            - phyaux
> > +      - const: axi-noc
> > +      - const: pcie-tile-axi-noc
> 
> These sound like inter-connect clocks. Shouldn't they be controlled by 
> a interconnect driver?

On other platforms, yes, the EMAC AXI clock is only a gate, and the
interconnect provider scales its rate along with the NoC.

However, on Shikra, the EMAC AXI path is fed by a dedicated GCC RCG:

  gcc_emac0_axi_clk_src (RCG)
    +- gcc_emac0_axi_clk              "stmmaceth"
    +- gcc_emac0_axi_sys_noc_clk      "axi-noc"
    +- gcc_pcie_tile_axi_sys_noc_clk  "pcie-tile-axi-noc"

This RCG is outside the Shikra interconnect provider's control.
EMAC DMA does not work unless all three clocks stay enabled, so the
EMAC has to hold them and also scale their frequency for the line rate.

I am hoping that I understood your question correctly, please let me
know if you were asking something else.

> > ..
> >  
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,shikra-ethqos
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 6
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: pclk
> > +            - const: ptp_ref
> > +            - const: rgmii
> > +            - const: axi-noc
> > +            - const: pcie-tile-axi-noc
> 
> No need to repeat the names here. Just 'minItems: 6'. I suppose you 
> might also want:
> 
> contains:
>   const: rgmii

Understood, I will make this change.

> 
> > +      required:
> > +        - operating-points-v2
> > +        - power-domains
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 4
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: pclk
> > +            - const: ptp_ref
> > +            - enum:
> > +                - rgmii
> > +                - phyaux
> 
> Just 'minItems: 4'
> 

I take it you meant 'maxItems: 4' here? If so, I will make that change
in the next revision.

Thank you for the review.

	Ayaan

