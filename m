Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F925606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lYRSChiM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEzLWqUd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=; b=lYRSChiMtIEGP5
	lYA/vYvpBofVvO8t/2AtpFohdEJOmNx9wZIp+mAw8kybl90yZ1jO+wEqvAPN05IKvkKxc7kOjuvBt
	gH+0lotSXakLHoy3fJ0FeNG1PEeS1OEZ6zRQS+R5xdX9WtaGZkGYopYur25J3sB/pPmpP4WtBW2YQ
	v3hJd/pAfxI7VT8QcUwb9rIt+c/qQt9b1Yh4brVvtIwWWeT+pezNHV7fKJ8Y8kxs7eTAhHXnOYkI9
	TmWbj0WbiWDOCcUeQYz95PWruHZFJa+xr/ZpdnzD/YJs1cH+De6YdHkMYpPPGXTDtnCxp6D1M06vS
	7k1BPoKHOzjRt8yShuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6ZE-0000000CxRF-0vjX;
	Thu, 19 Nov 2026 18:09:04 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6ZB-0000000CxPL-023a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:09:02 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-499f20c7054so67521fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111740; x=1795716540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
        b=IEzLWqUd9qdyDepIHrjnL50GB/v3a4pdbo63wLo0VD4Tiq3cKhc+XsMm/NNtW78ZrA
         kGbvg1SxyHU2sod+u/AuQf9xBx8qAwb5MJdds9XlxNRUWn2uDI/Zqa5Qi0IDUkRtofIJ
         SmQfemOwfqxFgBmYXuj1K/Zy4Tg9duufnPFtNeFHBR1njzNr+xR5NdZOLc6BPTHKu16W
         SFHOjMBi71EIoeFKedANx8U0cU1rb5oiWAmzsf/F1qcfE06hOerVT1x9Gu1bXGBocCe2
         czjX8OBk88KninJF5DNBFWu+Vmnw/AqEQoNwfEgqjv96rm+LcwxrFIgYPUOHWyJk7N6E
         XZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111740; x=1795716540;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
        b=eKV8AnpvZ5XQcfY/jd32yqd8ob6ufanLRD2kxYr97/NqaDullKerXeDrq0uNLH9Oc/
         9web5JtEVULOUKUKWa7liq0DTvHupghG9KQdE3S4R7xTxCYSy4KvjmlU6xR9rxSmrX6z
         jf92WU/E8o7SVKlUo1K4L4EBRwaSlfOqK/ztDfVVbWJQvmYUGpRPUHhcJQTJTOe/GzIV
         4LJ0FKEj9/es5vYXcywQ/zOSlvkcB8HXIxl5LDKfPpwS/EiC1gno6lmByGsqR7qZ3rI1
         ezGzQEQejHdp8XfDvwMdHF6RY2+0vrRchuDQc4HvBmpb+Q6wM6LqybiOFaVkuj3xYFx8
         iddA==
X-Forwarded-Encrypted: i=1; AL+hErHlFeSyy0vMqd8ApiFo+sADvccmtvtuTKRxp5tg5ci1pkWHFOctzsT3X7/MJnrmZTbFFS+QY3hF99OTckxv8IVW@lists.infradead.org
X-Gm-Message-State: APuU4Z/SsrbRe9nd2xeXk9cl9lxVo5ysWB/yWiJpvuosSbvHCJE2RU5q
	0MF0tWvDN3pYVbe2SBRxS5SZ1FYeXSSd5ow0/hFarbKvnUVcetk+Fg0Y
X-Gm-Gg: AYBFou2YcbVoga/6yAYlZp3L2vzmfoZsDn+d3T8k9JlmLBI9AtjX6ZTp+oGW/w42zyy
	9MqEjWalEq3kZ8HCuEYxtLBMcid6sBL4FwJVt2jWOm9t7r2JMh8elFlVZP4hAAc6zSDIP8/lILX
	35QKBtxuwegO05dJWiOjlIrr3cppLQ6DDCEnXvCfJ2ZJ8KDx9XsoB0eHbRovz0C7A25qWGpaZmd
	fNCH3upcL6WTrKlXrQ8hISuZkncHpRuNBVabFOtT3i7z+5ekvXsPKxOWsxyNOgE/X6C01GeeHfe
	gSx5ytzUdBcnY4LG9mYjWV2QX5y71DoYRQzws/B+VPCGOqO4UKyLGElIP0oZ4jBx7rwlhtjV1JX
	5JU1SsaEAJUIdRXc7dW8A5w7vM5r6gbjGmo0U4C9G0E+6tZSCTZSTk96z2c3Q6bg4ajz30ZQwLn
	AmSEjAJc8P06Jr/CtlreknAzoG6akGTG6Cx4dfEvR/JHw43cDB5sAZ67EfKq0DaiY3cHKraGRFy
	dkmyOVdEKTQiPdbvNVp+MPb8Cg6s2bAUJiMeA0T1+Rm65bygHuCTjSOIf0vPxgzxhhchxUd+RuA
	WfdYUCMhtdQtI/LJrI2K5Ijn5Q8Pv9o8FSVdjqIg9vY1cQIblme0MpgpcVpC7pynq6vjT6OcpRQ
	j
X-Received: by 2002:a05:6870:dc48:b0:491:47e1:6283 with SMTP id 586e51a60fabf-4bc810b3516mr386675fac.27.1795111739744;
        Thu, 19 Nov 2026 10:08:59 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc61081159sm452437fac.15.2026.11.19.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:08:59 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	wens@kernel.org
Cc: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
Date: Thu, 19 Nov 2026 13:08:57 -0500
Message-ID: <20261118-a733-fwclk-v2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <35a06829-dd6d-4ef1-aadf-245d1e7ca433@arm.com>
References: <20261112-a733-fwclk-v2@gmail.com> <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com> <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com> <124bb855-f2f6-4b10-b0be-99fb53cc2ee8@arm.com> <CAGb2v65A4rAFTFYyB_sZBC9O7fb0TJWE1YRjdGrLeNgwyVzcSw@mail.gmail.com> <35a06829-dd6d-4ef1-aadf-245d1e7ca433@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100901_072143_99B3A1F5 
X-CRM114-Status: GOOD (  17.12  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chen-Yu, Andre,

>>> But I think there is still the arisc on
>>> the A733, so this would more likely run the management processor (SCP) code?

The A733 CPUS domain has both an E902 and an OR100 (manual section 1.2,
figure 1-1). The vendor SCP firmware Radxa ships for Cubie A7S, called
"arisc" by Allwinner, runs on the E902: vendor BL31 writes its entry
point to E902_RST_START_ADDR_REG at 0x07032204 (manual section 5.2.3).
Radxa's BL31, in its system reset path, sends a reboot request to the
E902 through the CPUX-to-CPUS msgbox. Exactly where the no-flag reboot
stalls is not known.

> The question now is whether this SCP use case is something we deem 
> useful, for mainline. If it's just about to run the BSP firmware, I 
> think we shouldn't bother, we just don't support that. But if we end up 
> running something like crust on the E902, then it's a different story.

For me this is only about the vendor BSP firmware; I have no other SCP
firmware for the E902 to test with. Upstream Crust has no A733 target,
and the A733 TF-A port under review resets through the watchdog, not
the msgbox [1].

>>>> So, not a fan of this. If the loaded firmware somehow needs some resources
>>>> then perhaps the software that loaded it needs to somehow tell the kernel
>>>> they are needed, like the bootloader patching the DT passed to the kernel.

Vendor U-Boot already applies DT fixups, but the A733 CCU binding and
driver do not accept protected-clocks today. A loader-declared handoff
would need a new binding and driver support, plus loader changes.

> So I wonder if we should just pragmatically add CLK_IGNORE_UNUSED, to 
> not shut on the door on this SCP use case later.
> If we ever only want to use remoteproc, I think we don't need this patch.

CLK_IGNORE_UNUSED would also leave a future remoteproc driver free to
gate the core. Chen-Yu, if you are fine with it, I will test it on A7S
and send v3 based on linux-sunxi for-next, with Andre's comment wording
and a short test note. Otherwise I will drop the patch.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55200

Thanks,
Enzo

