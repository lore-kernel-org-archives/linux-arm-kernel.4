Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CDD606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 07:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PBBlqDzy;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p8GbARHd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HBFDgwZt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=; b=PBBlqDzySVn8WF
	rqg3cX9JPyzkXUCrV4TEmZGgVolEhcYU2+i4IkS2Jf1ePusypjaqARiq/6XTT6ayJzxjwQ9PAhGc9
	5UGiQu9ymns+9pDzBCJf5bh40F04RDzXM/8PTAXPOXX6krRg3R/3enjJnZt7IBXQfBN0Xz81rL/rh
	DPjDNdbqeBfdhREgBFeVhzO2skh8U9TrXg6MrBmrYuGe3gHn8ZiTS7eCCQshu1ob90CrQiE+hVAfy
	H5WYH9nagX70UWB/J4ydKeIrQ2BWVPWDulBaEP4cBYN+Re4nAA6xJIKIHiDo/OGaw2yC7spu/gf6p
	IGKI8knAFjvwZt0tmTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS8JM-0000000FZKF-3wam;
	Sat, 14 Nov 2026 07:36:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS8JK-0000000FZJu-3uG5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 07:36:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE60jv23161593
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 07:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=; b=p8GbARHdooMNXeqv
	Zkv6uk/x5rBePH5QsOT2AC9pmM6Qc52On0W0aEl+ycGtXiYESxalPix+PQtx0tv1
	o57ioUbF00ZRnIR5ROqayo03An+p12vJtw81OGb03WfrV+ADQaQaEu3lDQ0i8nAY
	3W/S/XcEgXOH7T8kXZlaS5N4NLEuz+N/B/figu/bKyGTCJ4O6dtjfAC7E0GiQ1Z+
	BZOJkMT9N3odql8+G8PqdzrJi5sMimrIzezKODeyNrwHgwaESSFyzJivA4cIDEWr
	5HiblN+rDw9dJKENTzWAp+BU8hDDahOKh96G7a5k5nYG9fRV9xqae6jwNRMDlwef
	pdOTfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjr82m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 07:36:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so330195785a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 23:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794641789; x=1795246589; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=;
        b=HBFDgwZtd2HIAuJkfQ50krZrLKhTofIvpgrDaev7cPAcg8fj7AQhuUieNNwbhHEYuZ
         I81v0NvFb4JIg+d3ibYSkpv/I0YJzU0wNteUD+y5IKsmH0lng63F5eTQCVdcoZ8LxlN2
         dN2BkeJVCGp0rlZ+xewOOSUG6XOySf/+OtoGMoX/p/MRBjvDlxGgchYXAe3zj5VO+4Db
         /G0Oqqax3UJOLX0avy2hRBQhC640f8a+tAOxN9OPaplZeok9hm/79ncTV+twnCmKAikz
         OUzlya34MD2avBMtnlwcCeJeCm81a3aSiOCxvvDXH+VvOHORdR9Vc1QK/zFEET+/zib6
         UC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641789; x=1795246589;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=;
        b=hjv7B25Zi31LKRAtZeWA5Af23ZyUWEVTR8YVqm6+7dv1IGYn/V8O3ZC1XTrGWuaN/s
         CPpHH1sWZSxPXLOxT8wqbCg+jnF6V9a1w3eNjcv/DdwiKNm80eV7MyodKeUmd+Tdd7ON
         SM6GvP8IRRYn0JsnR8WCNVMEm9ubvFI3HzbrG7fDrc9RcsDkU/pde7/QFpzd8lIkEUkh
         cX9bjN7pAohEpUTBfpNAVcXeU7ac3xc6g3bQLmm2uVQrhvmFamv+pD9XlYsoo4u+SGfS
         +BCkwN/iqisJIKqd+6IpFDrK4vq3rwmT1tlVy6UOnE4P7FyT3DjxFWjl5aeIxdUZf3P3
         EqVw==
X-Forwarded-Encrypted: i=1; AL+hErEu3Q1XnooyUB+k/ApbPviFGQU3BtBwSN8kdEsmlwveSg1JUYdqL5uJot8itKrun0DSJghSD2UKELjojnXWqBXF@lists.infradead.org
X-Gm-Message-State: APuU4Z+g439pJWw9UxqgP+bkKAjCVTzXJPP7hYm+yJuLNPfBqGphXsO4
	txNF4Mu8ynGpMmJVBc7R4SRXnBNnvkr9yp6eWOIzoSKnd9zZR+1tyhUMtNho4Keh7Dg/JdIdO/L
	faD/vX6qfErxxkFUux2TfhR+hYTNvxPR+J6xqEIpFEoMR/HsRWtIwFeuCbQlp7AuaUR7mR7zenx
	GwvQ==
X-Gm-Gg: AYBFou0ghl6xBR2MAwUqXahn2w7PyR6Mzqfg6irEO8cxAr6NrrlnrgIWHN6GtGdfK3j
	aTxkeUgUJNqcH7cxp9fzw35ZBW7uik7ZrmRqB+OWvNFG3gkzE6yFJt7lP/wuJcfadAtejSwn0Vl
	mrBhVALRbjHKA6P3d8j09isQkfGwUh3Fn8j+9qN+WemwZUv7QXE7J71OZDKNt3H2tG3G0L95V6q
	+QeATHt8KPcL7yLCGqpX2RWkw6zkDAIRoou8sQZV0TYP4Vd1UWMAkLSEmKIjknXI+0rrCsEbaD2
	5egDyCY0DaRReXSTQ/Dn7Ljy2zV52zs4+tWid7XjZo8Y5vKqMtRdowakPnRU/nEEJ/cz8AjQBb7
	ze8iCYJk/vYPNB7/7FZuc5pt2fU/hU0MuEImKV1nq6mTPIMVPat17qaRGJYmwUQT7VH2wweflbM
	o=
X-Received: by 2002:a05:620a:2843:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-9494bc1b7d4mr810228185a.46.1794641789608;
        Fri, 13 Nov 2026 23:36:29 -0800 (PST)
X-Received: by 2002:a05:620a:2843:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-9494bc1b7d4mr810225585a.46.1794641789084;
        Fri, 13 Nov 2026 23:36:29 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f97257sm75459845e9.4.2026.11.13.23.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:36:28 -0800 (PST)
Message-ID: <246d5116-06b4-48aa-9805-b265005dc8cd@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:36:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: Correct white-space style in
 stm32mp2xxx-dhcos
To: Marek Vasut <marex@nabladev.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, kernel@dh-electronics.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
 <2cfc503c-8da2-478b-bf5e-c4dc87bbb2d3@nabladev.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2cfc503c-8da2-478b-bf5e-c4dc87bbb2d3@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzMCBTYWx0ZWRfX+06S60avawqe
 VLKsqcf2HOw1ZwbNBOSOmkjcFNehylkUqsfAFGQezXwOXiH6Ia7W02ggNrdIDNSPHjzE1aIxWBe
 gTxvfbbvFoZT4Kqbvg6/o1c2IjkAGn9dON1vSrDrH5d0jMXHdanfJOiP5XmUxeJmo6+EF2ytlxX
 FqGN8FgInaIsHwLKE91jDxli5bDJh97wpZN+WwOWDdsKXpygUM+6HqccPY29EcJmfUF4ONkS0iJ
 G28c2d3u5qQ5koNeCUsqRHjkXkxym8vP5Ya9+FAzY7P+NPRV6pu4tavMM2lnGLK+D5y0IQgGjHg
 krrErCqAmpf4bhDXev2bw604YzOUWDhOsrmBkczVc/X/pbfLytBihzMS1Kn3gC/H2Hia8cWJ9+e
 vkh0Tz29plqh35luryTtoL61ihwifV+6H+s0DRwVFfYsMZ5QIwg9LhG7cRW6k9f38KTvbgIbkmF
 19Q+I806gQahY+iRqbQ==
X-Proofpoint-ORIG-GUID: XWFXRjveRTc4sX9tj0wBUohfwKGX8ckQ
X-Proofpoint-GUID: XWFXRjveRTc4sX9tj0wBUohfwKGX8ckQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzMCBTYWx0ZWRfXx+BY6l6pbjSd
 mo/PN8knk97fdZOhVDGez4HZETlcGom9JucLCdSO1w7M3COYJqCIjE0CU1Z4v6idqf90JQo7DBu
 IGnmOAWPMmhB5iXzPmmCpoE1owFjmt0=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af80f7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p-LfKV-GAAAA:8 a=hS7FZtYCIGGB5UC-1UYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=97BuGM4RKn6GwmfqMd6i:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_233630_991152_FA5AE71E 
X-CRM114-Status: GOOD (  10.93  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 14/11/2026 00:34, Marek Vasut wrote:
> On 11/13/26 7:54 PM, Krzysztof Kozlowski wrote:
>> Correct minor style issue around white-space - missing space.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Marek Vasut <marex@nabladev.com>
> 

Thanks

> I hope ST can pick up the various fixes for 7.4 .

White space should not be a fix...

Best regards,
Krzysztof

