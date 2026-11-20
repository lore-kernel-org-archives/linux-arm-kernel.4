Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B0F60A2617
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O/N/wp9Z;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=EhJfLeBL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H4FGooqlFWyqGkh+aQ/av1H1BBYV40gcH/hlMVUd0co=; b=O/N/wp9ZjRQqdH
	j6+aBrtI7vEm4QCE9YQBzIdPtMD2Z3y6oDd/ZuTIo3cDXsn0c0pXVtKPGP9/RuJYxWZy2q8F1/gpL
	JQHDPhkqHIllAgPLgSk6JkW5HBBTX7CRa4UiFtRBC5buw980T1V0CHLPtuM1Doin50YzKdcKvROfS
	LFA7pBbBvxJg8zI2mGr0qn6xvQGeX933tmBgPHzp0MKOygjEipfCnb7Ts39kVA6SkhiDziU9kG2xX
	lV/W6xgxdrdtt7/1JZCo21Tu6vNERSxPsjEcGk5lLt5BMGqGtnYntzRCReILkQ17ukdEHhXOW9EX8
	C3NzZwglt15nilUL9qfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToe-0000000Fzox-2wxT;
	Fri, 20 Nov 2026 18:58:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToF-0000000Fzf4-3grS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:58:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso12083915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 10:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795201084; x=1795805884; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4FGooqlFWyqGkh+aQ/av1H1BBYV40gcH/hlMVUd0co=;
        b=EhJfLeBLyrroB1UaolCpzE+Re2y7X+SJlgw+Qn39g1NBfKnrCpWY2ToqqBCaAt4RIQ
         q3KKS7GuMdzrk66NYYltKljcvyCpP7nos6eoXEqDhoQo+vBaXWJAKHSv81WGt0z467Fo
         d9VINkZktbCId4ybbVFt1P+twyTrvXOPdAfGLdCo7nnrcX8swTvty4ygYtOyORJvU4gs
         qG3Rw9FLdV2L8xyclT6Ln2pIwNkLC3IhSO7Y0Ya3gDlU3Cw1sml70hblGQacuHu7pi8z
         ddyQlPTWxkUwMADqbenAGCiDeZ/rBXGy4KXl8dkkV33zZDfLvGg32VOCxk3aMlXluNUc
         42oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201084; x=1795805884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4FGooqlFWyqGkh+aQ/av1H1BBYV40gcH/hlMVUd0co=;
        b=upUt1venJCcqyXSmNkfreA4I9lZP7aPvLpyDInyYlHLQmvT+fEo19qgrEHCImAEH0e
         Myxo3c9qS8wkxxvKVilrT4VOO586pao4W4XZc7Mo7aXiK3mgN9nkKqTokB5/cuwaObhq
         dzotkb95A2BiAnrLwBRtwRyUHXen1kf0hSk/mxx5WYsoIHW9k/wcH5npZjbFeUAixFG9
         OyW37EXkqhk8X2QA0cXP4p+9udkaGkb1I/1JqhIOyPhTFpvJbIbHANXL06jZ2oojda7B
         DLF73wqtSZ2Bm73V4tREbac1wJG/hPBYoqTp2UotjpRCsSqxjHn3hGayk7s21a1Ye/Bd
         KZVA==
X-Forwarded-Encrypted: i=1; AL+hErHKlFiyQgpsCVu6SdSFsGRkqQD4IaIPDkaXm0IHFRbJHlSHdSkyWB4QSGUm1ZfOP22xLxvl/OwD24fjaPxDZ9xr@lists.infradead.org
X-Gm-Message-State: APuU4Z/TxcGu+7K2mvqg02njHZGhHtHxI4G7+gyhINMrwzZ05n/xH5dF
	t+vPjDVf+BvRjZ6AvknjAjjkI9huK0T5w4slx9B/hzZJx5hA+US5Io5Plz7o5fTSQqk=
X-Gm-Gg: AYBFou3nqsGpyB9EBAjzz8+zc3IMXTC3CEE4RVC3WrY/Zx2eQfL8AiVVO2+GtfSh8UV
	sM1nFH+6zC8IgD7Zcv2rdUT71reaSaH+jK6ObcbcO5OolxJIz/vzti3Z/LdvmXqO5WR+C8IWSH2
	uAc3MpU8EyJ3FlrZmVjo92RzyFMUK0Ixy5oXOQUgogUC61s62h9dWOZb7p16bAO4dGrTeRmemhH
	5J2Xh5tcfjcbki0IN7aw97Yo2W/4Oqmb0SkB7Tdixu0UB3JgUvC/fQKvmMPUP7UuoArp2NkYrx9
	B18+DEVvKPRNdV/XlCLGFa1A+Y3Kg36RxTfmMp/NoYM1HhxURnQ54fOseCLGpw7xgMGVnGJRqSB
	IHolLK6ULdu+RAseItLScahlO9MLupt4CCnLMg7O3WDOdJnJPPsTfL/+7pDu2LvE65gW29qobgp
	gT33BGL0oaMryuLlIemwugaeFZyPvItjm+RwmtXxfnUoNXrmV4vQM/VyOPHgz36ekzParGj89e7
	pcJbL9CD9fl6+QZ5CeMrg77kppWiXjrtW2Jxx8c19kXwpa/i8r9CRvRV6+3t5J8DYFdkjYDI2G/
	5LJIV6gEAYUGS96cvIn3SsseP3CpoDrtVzZTet40jItDsVZTi8A5v8O7bTtL1Qsvorjr0L6vF6R
	MJeWh4MIn4y6+pqgtCDLYFfCxc3w=
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr95550835e9.10.1795201083545;
        Fri, 20 Nov 2026 10:58:03 -0800 (PST)
Received: from ?IPV6:2a01:599:241:b744:2c96:9736:bec3:7db8? ([2a01:599:241:b744:2c96:9736:bec3:7db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm97210445e9.1.2026.11.20.10.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:58:03 -0800 (PST)
Message-ID: <9519e889-8c78-485c-a31d-28df8b7cecc3@9elements.com>
Date: Fri, 20 Nov 2026 19:58:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com,
 billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, srini@kernel.org
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_105808_080665_F63FDC15 
X-CRM114-Status: GOOD (  15.24  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/26 6:44 PM, Prasanth Kumar Padarthi wrote:
> Hi,
> 
> This series exposes permitted AST2600 OTP data through root-only NVMEM
> for userspace diagnostics using raw offsets. It adds the SBC NVMEM
> binding and a read-only driver adapted from ASPEED's downstream driver.
> 
> Changes since v1:
> - Add the separate binding patch and rename the driver nvmem-aspeed-otp.
> - Poll once after a 1-us delay; retain the 100-ms timeout and log failures.
> - Initialize read mode once at probe and stop commands after a timeout.
> - Use a fixed secure-prefix keepout and check the live SEC54 range on reads.
> - Simplify copying, locking, configuration and Kconfig help.
> 
> Tested on B650D4U (AST2600 A3), OpenBMC Linux 6.18.24 and upstream-based
> Linux 7.4-rc1: repeated reads, cross-pair reads and 40 reads from four
> concurrent readers passed. A 12-byte range matched the saved ASPEED-derived
> reference fingerprint. The 7.4-rc1 RAM boot used the working OpenBMC DTB
> and initramfs and also passed the final-pair comparison. ARM zImage built
> successfully.
> 
> AI assisted with driver revisions, validation tooling and patch text,
> using the downstream code, review comments and Neal's hardware guidance.
> Hardware tests were run by the submitter.
> 
> Prasanth Kumar Padarthi (2):
>    dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
>    nvmem: aspeed: Add read-only AST2600 OTP support
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

Again, please fix your threading... Other maintainers and reviewers 
already told you in other threads that sending a new revision must not 
be "In-reply-to" to the previous revision. See the "Explicit In-Reply-To 
headers" section of the submission documentation [1].
Consider the use of b4 [2], which can handle it more consistently.

Tan

[1] 
https://docs.kernel.org/process/submitting-patches.html#explicit-in-reply-to-headers
[2] https://b4.docs.kernel.org/en/latest/

