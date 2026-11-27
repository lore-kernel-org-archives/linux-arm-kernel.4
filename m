Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v9aGZK3A;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOjcsKcu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GpUgeGpA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=; b=v9aGZK3AfG0fpG
	BYO5RMfmE7nOM5wW0YrFYyUFgexGmeRqwPilEZwlH9wlxD7idg31nTWaY/dPFnrLVsMwkNeTFl2tI
	VywFwvXmeHe92zVyXOvI11dIjPtuUpKrF5u4IptN2Yen0PaPXfeNTNXS9kEe70hIWO3gw2ClVGU6U
	AxqMsqUV5OSuHKWzchZNBflAcbrCULy/9QZByO99Bpg7WjPOgLhYnm5Me/nyam6gK/hq+nV2m/mGF
	+lRRbkf7YkA3CaAUuBq6OplRXflfY0OiHZJcxPT3PmquMZcHJd98qgb+FZz7LgRCmq+rtnXe3MUbw
	SF0YmD3B/UdI7VK0Mfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwTS-0000000GJyS-1hs3;
	Fri, 27 Nov 2026 13:58:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwTP-0000000GJxO-40yw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:58:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDtsuU1451688
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 13:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=; b=TOjcsKcuDkQqhKEM
	pY+66B0jBD0y+w2WuxCnqNyxwYqmtuMoZrTl0cJPLd/mTTklLplbhyMHb4TC5Wtq
	Ji2Qk2dzyLEh2cMIRuDPdYHqZpE/N6fX61D4TPWfBAqekwTKIPscpXnW+mrJEX1g
	T67dFtRLf4IjNGcPXVhIvoHFM1MztDlxyVpCMHvcXvYw2hHwPLywFmqnznbL2nOM
	sz22SEUOUEnjiVdwNO2bgpnoMVFCLggMv5jNCcGehEEubP3PBl+8lUty7whgbc4y
	8od1uEnUK+wQdjbAqIyVdpYI0rzoM6UghTNlC4hv0RttWqdHeAoj6pqD+rHn22WG
	zHDzIQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqm8mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 13:58:47 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecf0967947so334130e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787926; x=1796392726; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=GpUgeGpAwTwnF8pBzjtkpC0EPsTamUOrkc+oAFHQqqB8xV47lOSezPQ9TST9o1Ga0K
         0YxspptSYrmlw1gPhAj4XFv/ZjbV6nyinDEGlT4oKA8NHRZ3T65Sl6zxJcUaE90JriYW
         i8ikPvwBR/S0kMBjNbsFwj1XXvcWhsw7w/CMu/ix+SwUb39SI2j/dHcvyV2+RgaaF1G+
         i97DFi+fPqLyjH/AHy0hQ1uLBpThROgJiqjthSPnLs39fq/muRRkGjGJBDL4iDhtUrMq
         R/hFl9t6b1eujahhCKP2hnD8VtCNU+h6iy1M1Pn0hnGvvvk7daY/dPlpvh2d9y3FDcZS
         4fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787926; x=1796392726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=aYqi5IxC9QeoQ+u7vAKOjAZtpokShaqxRU0v3Zuq4cg7T2Y49vzvT8WMKzfQsj55eH
         UoccPwOtFxEVVnkbgjrvzz/1/qDYHSL6+rk/1TK4CnxFQSmKWwQB1ptBBcG0Hb3bGxE/
         hGz3S7HGrcuucEnG3QAQ7ZVWYWgBDEuop2poKmXxDk5UvkYV/3uOyBwv0+IGh0IibSIk
         U5BZ5y+J/X6m06ocuImdQX9AqQE+TYYsedFLrfKyw8XGrh9SJ4tS7widTPWcohhhpJ6c
         endHeWuaUOzzb2ZerTReIR/t0C8u0NAV3tug0bppLsSR9owaN17d+zs+FmiXBi13ATMf
         0uQw==
X-Forwarded-Encrypted: i=1; AL+hErGoA3oE5UQHtmAk4mdMK/CmiQ1/lCQYvSYryOc46+DBYv3gyovtSvj3P2CBBHkkLbIgk40q7SCkCPTmk8sPg4H+@lists.infradead.org
X-Gm-Message-State: APuU4Z++//gtmyiHjNSQITZ2FdRODbFM1I89hSuFd3MWQ56OzEmZfSSB
	CQ0m/dvr22aYvHFEZkjLUHcA3E1rjTORDNRifrNpH84fpYmYBgK+0FAtdGdU9z92FGhlCF0Y6W8
	MhZqz/VtxgXU1QwHrG0YePLUBX5KikRcsugURJS2wUfutmrj/DunXNLmzp4SeK9Z8IFZKfdhOHA
	etYw==
X-Gm-Gg: AZFdTZfhxoE4zEvFsNYS9eVrVHuBZ8Nrk8FGUNaqY5ZWg2IDeWfaVdtPN27QGklyo/S
	1AViJwduxu+liw9n+QK1evQr2u+tsbR0MmHSwR3nbk7xaamqm1T8QGokSrVoMYp30NxCyCuHEjb
	i0FknV3MuuSKsWL+C9oAGL3hpQhB+CxcWEGa0Eu1AzAUhKqSqsXq2a5QgNqFUY5RiFKjWfF8YKF
	XSF2O/BBVCi44bXB8LBJRMb09/xtAKz6aeSVKfC/65GRMJdlr7sThBaJR6mTgdZHavaHZ67Qg9u
	6g+BxGpftzzOuoCUb2gEFjjjXQJqIzRvV61OFONv2Z3Ih+qcSkgjLR+olLPEApoUL1/uNvxx/xa
	+XiprnjPCU5fg0LobRMg3dhImiQOhjC3ioW3HVm3klrHODbAYg2pw6HAUVhgaWq7WDVNHZT0=
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434855e0c.1.1795787926342;
        Fri, 27 Nov 2026 05:58:46 -0800 (PST)
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434775e0c.1.1795787925770;
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm10578803a12.32.2026.11.27.05.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Message-ID: <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:58:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
 <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kMRUu3BfkEXGeBJL8zBlrCsLPiemehlI
X-Proofpoint-ORIG-GUID: kMRUu3BfkEXGeBJL8zBlrCsLPiemehlI
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b098c97 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pIfNyjNAQl_vEFP8Sf4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX6DuIgmuEtWCl
 sQcd4FUbojKEWJSmsEmnI+80VYQZbrD8k486kDAXstVbMg5BnEsJzl4Tpc4JByHaB7rFXSjT/nw
 o83vsuiBQUNzkW09cAQUx/JU6Ju4R+w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX6ewzgnYIXlWU
 210JpftwGCpeMuYIctVKf2xepLFcMigKurUPQMwqavdZVvuksfyGGvJZba67FArg6N5AcWgkQ2A
 cBwmtS3Rc3+eqMsdCfqqgynuIOR6OW2Rn6aI3R54ERBLmSM5wzBlRT1YyW3jZM1too3EMHOw13v
 NLoP4hLe+otDoUcAgK6KRgLuWMHVRUY62f3JJmvjUiE/TSvLs85VwL7vFaUpEDPfjjIbVoXmBri
 +i8tYxFAcocKLeR0qZXYC1pH3lKUNELzbQeeH5e32mwKVZGGjs/4EmwKOvOOPrp1mVV2eot9wui
 wrx9IgQZAM/QmAKan4ssIYVPuIUVl62lrIv3FZG0oc6TETEA1X88ISG5Mi3XsQbwu5DxInmuK1c
 +nkVDT9/gEQNJWnGKewLFtrftlXlfnlSciGzh23aHEEDV4Lm3J7fOL3P1NzPrb1ykfhK3rCZVtc
 hX3cZhtykg50941ktkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_055848_014627_6F72ABFF 
X-CRM114-Status: GOOD (  13.17  )
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

On 11/25/26 4:43 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

