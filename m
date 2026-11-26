Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F79606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wl6VUcBh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JA2KCNpG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wBOZvbV/Ao3pnBzrcXZtW9CD2639Ae7gzM3oEey/+58=; b=wl6VUcBh5BTDO9tUV38TwksJ8W
	tGIX/aR16eM1MsC/NoW4H/vnzocGW5i/8ESrqgcwvvQdM7wUSZvtxkPC2vI+p+LX+TdHbol6145Zw
	bkOOaBm91Def7wLoXMvk/Xe4n3JyLglPYq1EgIlInIU/8ic2gnI+QN3Q9YEZe+4IhHqSs4QsrjObw
	PPY0tKUzGD2EUByQUM9Zp055My/F1bk76Bnyp96K78eLk403DPh+5wpiv4rf0G5o0W6IMN1SXstnu
	oKktisH0sHPlSRGcKsubOa1fnYkKUp9OQHhK0gn4tQi80AV1UoRe6ihFOaam/P3QLZ1wgK2NNT0GV
	mIZNg+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUjU-0000000CNCT-0hJH;
	Thu, 26 Nov 2026 08:21:32 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUjR-0000000CNBk-05uf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:21:31 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-386c71feeeaso3126924eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681288; x=1796286088; darn=lists.infradead.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wBOZvbV/Ao3pnBzrcXZtW9CD2639Ae7gzM3oEey/+58=;
        b=JA2KCNpGWj2j4fMOmewZhKa/uaB5liejhnuBXa/LCLIpkqmfdOv2va6i/ZJjBP6MC3
         41Ljsv6JY686UI09Z+4cOlVR7LQ0peU+Itsu/nOyo5EPrC9jJuG3Bf9YyzVmYy1tCPWe
         Oeq9ZLUZvutLLT/dV2/btyYkXcRx40e1pLS9cgAEYeJfaCq/hyc1apOVbEFjsj7+8+J+
         hONqxYcvcTQpOHK/4mDcBphaKmDdTSUJQSbdQHk/u0GFD1BoSrl8xLZlrU4JJ8nY6VfB
         XVXaqufpzv3NrLYea1RPZK1fOmJAJOlNNwa+ZCXyAf0FSHyZGMgNhaRcmn29PQ+uYdxH
         aK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681288; x=1796286088;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wBOZvbV/Ao3pnBzrcXZtW9CD2639Ae7gzM3oEey/+58=;
        b=rsUMDldRa2JKT9DbjGC4QrKx5HrDFkWMuFOO7HJnA7W96k7X2CLKbl4aCYVcPElcJu
         J+UnY34/EHT7ayFU33uTmfbsY1nKtg1uAHkq2Nc+xvxr+Jcc9RjphdrfjozTLTGufU+M
         u3RAZ601gBnplxPz2Zw4NTpYeftgpZ/jJjFfOkhA3ab4HRklE0pPrPEKuH6tCJA02go1
         KiyiY26EeyfvQP/gT8i7A7KBsuVPjzQYYaOysi8soCU1XieBxwPitwpzm9Sqrxt8a0ko
         R+g+fMBR6oMHr3DG7qFpeAcWUrMVGy/wW9R0Qk7hIL5U2worVCQVUFm8FY2yxf+bz2UV
         zrIA==
X-Forwarded-Encrypted: i=1; AL+hErE3Clt1uR1KSryhZDwIbkTbwZgwjx6/SuhcFh6nYUbA2Tc18ImAUJDs6oqwuCrVeKlcRsAJeKgnWwk9ti8m0Mzs@lists.infradead.org
X-Gm-Message-State: APuU4Z+Jk4fGByBzMt0F2hCsls8hUhGFreCChDLrygv6uwmdBBMZAtdF
	pdczpo1KC24NIqyxYMlOJxdsXATwl26p7LLzyr8224ZsDT9zrbXYx2r1
X-Gm-Gg: AZFdTZcw0rKISAxE1gjIE0ZjEubQzc9Adr+JvVk7ioXgOFoBB9XP4OIgn7icwcRwQCS
	KwrHjeAHJI5oFYqFiHCeyzvyCoBEEnw6n7uJNJIBWzMezp1gne/xYHksogWDp3DtfS3wiHrqFNI
	fo4y4kUm/5nCg6xgpco6v5xCVneYNlyKQrkxxsm0BoDXGg4GbJgYG9n7FaNocm6TXubZfwbE3u5
	udMnZ9w9FmcjQo0NoqhCU+LDwRNYNQIFUxuQV6kQaEV6khaVbcAw0cdjXMf1iGJZLFvLmURg6EU
	6Q6BEaA18KsgZUXwv4aNCh9+WbEIBMRLJGNhby6++o32DNEuBrdCCmj+z/CeM/xw6L4gDOjvven
	gxCqactkeOByyLFeO1fG7vecDLCEPyniI22cvybict8vQqTFe8ALR6TWfkupW/ggJks1Oo1xUro
	Q0M34ISbn5PWiUZuL1wc+ZdY5jXFJ+PkY8DyymKmUq1ekWp6mZaIfaVxa+x+A/3A3XKkABC0aVh
	sm6AUIBE7dFg1N0jVMMJ5UJNBKWwqwds6UjuxiVC1FoaOL8sA3b5OVXDknHJNFvuukE5csI3+Gn
	ZZ5iL2bZChlAmb+T3xnuPUek1RYnSScRAaSTFIsLMkoGXGNxryoP4eHC/q4XUNKbpoPN7Q==
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr31004036eec.21.1795681287254;
        Thu, 26 Nov 2026 00:21:27 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm68602910eec.26.2026.11.26.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:21:26 -0800 (PST)
Date: Thu, 26 Nov 2026 00:21:25 -0800
Message-ID: <8497d7101dc7524be91edbaa5a9face5@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Prasanth R <ragaprasanth@gmail.com>
Cc: linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-pm@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	driver-core@lists.linux.dev
Subject: Re: [PATCH 0/3] Input: clear the wake IRQ on unbind
In-Reply-To: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
References: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002129_068124_1A30E676 
X-CRM114-Status: GOOD (  13.04  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Prasanth,

On Wed, Nov 25, 2026 at 04:21:21PM +0900, Prasanth R wrote:
> These drivers set a wake IRQ with dev_pm_set_wake_irq() and never clear
> it. After unbind and bind, dev_pm_set_wake_irq() warns "wake irq already
> initialized" and returns -EEXIST.
>
> Switch them to the device-managed helpers.

Adding PM and driver core maintainers to the thread.

I wonder why clearing the wake IRQ cannot be done automatically for all
drivers on unbind, for example in device_unbind_cleanup() alongside
pm_runtime_reinit() and dev_pm_set_driver_flags().

The only case I see where a wake IRQ is attached at device registration
time rather than by a bound driver (or bus probe()) is PCI OF WAKE# in
drivers/pci/of.c:pci_configure_wake_irq(). That could be distinguished
by checking dev->driver when attaching the wake IRQ, or via an explicit
flag, so device_unbind_cleanup() only clears driver-bound wake IRQs.

Handling this in the core would save us from having to hunt down and
convert individual drivers to devm_pm_set_wake_irq() across the tree,
and would also fix buses like SPI that set up wake IRQs in probe() but
do not clear them on remove.

Thanks.

-- 
Dmitry

