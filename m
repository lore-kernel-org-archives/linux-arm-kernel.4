Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D40606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PYNbwAL9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IzTcYT/o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jsRD67du
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=; b=PYNbwAL9+mM5Nk
	/9TIeV8BPQb5nhOCbGwLZEBHdgGtPTih/fXraoKN8yOuJGOLWyrWyxJHx6PKl5u7ObUpG1o9mQEO1
	FcBMbRRMxFUDdNcf5XKTV35Pph5OhfqN8YrKkgbdkPlPLj3fc7HVkKqEqQ6Rw+W6eM+jB3QxpGvvl
	QUaA+uVJDqNPs5bQPqmsyH6I7YYkgrjfJ4idcwBCdT5p4fHBcgj/wUJaB4g1OX1gx5Qzt9jAeHD/i
	4qiuUfhqafZSEEbJoklNdOFFPrycsBtfwMiWv3w1Tgbk0zCAgOaZNGJdCWtHopLQA0Uu+he3imtdv
	yxbEPNYs2/MCDIRmt4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWupg-0000000G1qE-3vBH;
	Fri, 27 Nov 2026 12:13:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWupe-0000000G1oo-18MH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:13:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp7GH2268628
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 12:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=; b=IzTcYT/ozKMWXuJA
	qR2A1WW6ceB8r0S5rRexOAaw82FLGR9RGJL2KY1QkdqwqhxOyy8+EAURlkYrhvmd
	bjyzWZqkIEJQRryUt/C0tMhcxF/TjRuJdu3CpvRmL4ecVAtogGaVmu8Jno+f6yXc
	1D35w2HDNHULZb9fFmkEdlU/ey5qoHhGXXWmQ84kKqoOrd/u+VgeVOdFTzXHvTTM
	5tuCqikXS5HG/dFoCJ7o/VM5gf2SqaMLM0AI/WEYe8yHvUDuthglQhyNU9alv+Iq
	oT5NKBdl9W3LAoL5GNm96tf2LSb2BO8r3kIpeCe8oXIZs8fLvunOWPA420dvhkbG
	A4NYzg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhhrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 12:13:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso340725e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781616; x=1796386416; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=jsRD67du1ZhrtXjIOf7zciG60QjWGixpCnpYOLhn8FYBHwDKIe9iVXKbyPfhHwSwpO
         /BQP6hSnoO7++EymG7TkMDVonwhaM7FNXunpJ/sSMv50KuGwrWlhqiDKth4Mewp1mDFd
         O/J945HHKEIr6vI0oQ/qv89bRQxSY3C6B8vTHELjvbtAQQZlEbq/Ys8/fBF7edy5ORA/
         K7QxfTxlknQoZpdDyzvXRG8pYU9yq8sKWu5ZZhng9f2EZdiQZxR7WSv0fNM+++qENOSf
         ARGiC4XNAYFxnWSfAhAnRtLVnE3WTihau0+yYWzFItUDwjQSZFv3qUA4Uu95O/9XEqps
         1Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781616; x=1796386416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=iYNw7jbZwbkENx/79nuFgCo7VvsfDYVlFeKi2/IRWSxIhS2gAEInxVwZe5ktdsZUSw
         +X78jnyB2rk6x43fOJlSSNaOpI+5XSVFeF+vyEifwHWKK3VJnQp8D2rJnGHqawqojf6K
         KjBFsjytk0R/RcEVEjRRNVpIJxFc1GMCYQMaLE1TnU5Nq3cVh7OfYnnjbrf2AdNE+LjL
         6njXJOFt0yfqbAd7A/GI/oHLKc0hzsee6M70A7mdiXu/hIGcfq6oZqvPFKNwYvIq9N/a
         i+PDpdSCO3QljCc+PPuEMDDc4mwuBNNnZHxKmCyq2+K56WO/GXZNYZ6R7g9OHGWrx79V
         An5w==
X-Forwarded-Encrypted: i=1; AL+hErFyeLR8ht9nBAjRjwXJ3ZjCjPrygwQpo9+JOLE4h1D4raRRuSNKPy9OLsW8heUjVf3SHGb5/wJH99wN20zVsJuL@lists.infradead.org
X-Gm-Message-State: APuU4Z9jNiau1v/FkWiSFNKqP+axhGudvfuLbS1M22XFkJgZ60Ooq1Tn
	+khFZL3294bp0wJpGoKYC/kRmQLW14dzS0M7l6TA54OJg50s0nq/mG88PlYOJ9MgA1PaemrYolZ
	m3cZ5sXBtsIu5gNRpTvF5rGyMvntT6tOX08E5IRI1VCJlM9ET9mdsOsPjsjaQIkDv/8Dio4X/2s
	GI7A==
X-Gm-Gg: AZFdTZcw8kys07RCB1eaieIAaNPs6noRebgC2re0tzvlRT3eVqkFp9HFHUDvpRJDB/Q
	/IOu+vKWVYxnwoq92v0sRVb3F9Vw2Npd93Xrq4TMshGWTwGfUbPf4tvGieLmojkMa94owqXZkRs
	LialqXLwBU+6ZmTTpn2473aAZgFsdBPC9CZiL/5sXmUrgy0SwqZH+A3NvvAo8EyCYzyb9oYPhAS
	26HztmBRdSkJ8M3b/jP4TkO4y23VVksD0bM3XtiYUP9PoKcm7I5mxjVL1W2COpGqCONGKm/Jdth
	i/zYWsb/SeDAM66xDic4goJF0MW8sYNefpwUEQ115cnWqpa63ohs04o42a+LvI2VM1ISEQiZctJ
	WOqeKaGehqn2KdDb9i+BiMFKOoWXMxFPAEJJQz6SdjDR83uxHmp4n64fDiZ89fYnD0rEjiYE=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376768e0c.3.1795781615889;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376707e0c.3.1795781615471;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm845002066b.43.2026.11.27.04.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:13:34 -0800 (PST)
Message-ID: <c3ebad86-3421-4941-bf64-e400dc8f14eb@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:13:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 5/5] arm64: dts: qcom: sc7180: Add
 sc7180-trogdor.fitconfig FIT config file
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>,
        Peter Griffin <peter.griffin@linaro.org>, linux-kbuild@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
        Saravana Kannan <saravanak@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX0lYHvoLnlXy1
 ewu6SoZt25KxfCZiQBxgYpNGcvL874+lYLaq7+RYgLeHVGdBX4bKUis+2iCcoCKYSwGkZwMbHqV
 5C5MyPZzEpR8JeCaOxQ/fF2XDurZNDs=
X-Proofpoint-ORIG-GUID: tkRze1Fjk9082nYamZKbJoVYiQm1ew_r
X-Proofpoint-GUID: tkRze1Fjk9082nYamZKbJoVYiQm1ew_r
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b0973f1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=kMGPIAtnrfzpPBabNyUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX23UaIV9n3Ca+
 GdI0P8jpH9Zu/jLvxuwUX5Kk6qhdEm3S2cYgWE1pOIDHoBunBLOmf0OvUjJiSB6vBd0CXmsbeNn
 F3vYIAyUXXNbwiKR/HDnlPB7gnynqoF2ZpJfNP2/YdBjFRIL1mLxnjaL+rX3r9uOnwBVCoQ4oW8
 TELmWTjO0ezFWIfqQK+GX/UX/163aKu5NwRRNvHRu+zeAqQInzuzmmxlWM81acm7m1JxlaqEmiF
 wU82tbc5unyiZ3QVp0F6c/h092BbLJlVBDdzjUkMFDpGp4gLKgxu2kurxee0PGcK5m/lePXWcFj
 8nEyGgWHUHEvzp7zkz/Evjsi1zq7PEeWdkVpa6631eRiFCk0spn/UJgpd425YmgeZrXmIpUEgMc
 WzbnJ6BqNTKBFgr/S9FRNvm2a8p4EFQyEcGESWg/Qq8cIBGWmr+uJoRGxbzYp+huya4HviNcXPS
 rcot3xJojKmq+WQM9zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041338_315829_84699844 
X-CRM114-Status: GOOD (  12.39  )
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 10:09 PM, Douglas Anderson wrote:
> Add a FIT configuration file (`sc7180-trogdor.fitconfig`) listing the
> SC7180 Trogdor family board DTBs, allowing the LZ4-compressed Trogdor
> FIT image to be built with:
> 
>   make \
>     FIT_CONFIG=qcom/sc7180-trogdor.fitconfig \
>     FIT_COMPRESSION=lz4 \
>     FIT_FACTOR_DTBS=1 \
>     image.fit
> 
> Having an in-tree `.fitconfig` configuration file for Trogdor produces a
> FIT image matching what downstream ChromeOS build scripts
> programmatically generate, makes it easy to use `fdtfactor` on the
> Trogdor kernel image, serves as a template for future Chromebooks (which
> could encode board/SKU matching metadata in configuration match subnodes
> rather than combinatorial `compatible` strings), and helps community
> users building upstream kernels for `sc7180-trogdor` devices.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

