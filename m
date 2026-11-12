Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A2E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/SUgRil
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x7avfF8CE7MQkedzx8waSCJsEYoj4qczcsv6b4mLDHA=; b=m/SUgRilScHFzwxN8q8/ExSG0Z
	TFLw7L3DWgH8ofuDY1qNJjofqblAMvXcBgH+XVIFagvmRjOQtxYK5pVTlLrEiXetP17SUWAFhF/46
	hDPYOO6zrCH67u9lXNvoBly4gMjPxc2309TdEPjVc8nherXzXQ6NwzdRazTj+ISec/1UjnVA9S9wk
	ODA81QHya9aGvLVGUtfMpQ0F7Bs8HeTFTp6w5CqClEXjn/cuzLQIpnhlOgxxwRz5q7T2S+fnUP/YC
	sjW2ZS7DiMGhKEE9ZvIaNz2qhRZKLFZKTKKjO1XuN+vf3KkB3Y1XQolOJR5IRqEBiTfTLRcP6SfN2
	ObQqF4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa9t-0000000Av9u-3iEM;
	Thu, 12 Nov 2026 19:08:29 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa9m-0000000Av8K-1dbq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:08:25 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so173586e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510501; x=1795115301;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x7avfF8CE7MQkedzx8waSCJsEYoj4qczcsv6b4mLDHA=;
        b=BNMJFRl43suvO8xAR8EBJN3eNyCvOSUcyxbdE0haGPBpx8F1Te4wimUTxQVJlpURDu
         qcUhCLBgb/EJY5fEXd7Mk9+uPQA38d3t/3hhY/f9VDBp1kdXtNvRuTt5P9cF2w0ousLd
         zjJYn7/ePsSsj0GCndDhHmh0rSd4KftO0D7cS9eLV/Ly1ihwaA5BZJeqZsllOWvUf9Up
         ThKRVbyH70j3ty0beXOVbEKKWv/LFLkbFyUH8m0WW7B6qTqT+0g1nHoTpnONpOxEWW98
         RfW911YcqzhHP+aM/Jbqp21cJ0MIjr10dyyRma6UBhTTslWejaAD94DXZ4kpQT9V9WPk
         q1XA==
X-Forwarded-Encrypted: i=1; AL+hErEsy2LR1d1EkeYcMpm1CtxSfpIYth1F2iQ9OHv8cYioWaWZddsOEGJXvTYIlLSMosvMoBrLqyqhSsPQboPFJaaf@lists.infradead.org
X-Gm-Message-State: APuU4Z8hlwCldjk+IZpW1F+xgybttlRaQ4C4/L/jO4LSehktzkY7kU/O
	rnaF4SaiA4RyllH5gQMzIgQGSrRo6Ya/38yIdPRfbjpq3p51gnljgDZ6ZB7QkgF8czI=
X-Gm-Gg: AYBFou24Gg/DDA2QyQgCDajzLyU6IOQtRU4qwBa7vonRCB+xgVG1XS9CI0GSce9x1ZC
	S1TNZWVqDA6w9xI9qQjTkzU6loy2PAECz+0Y5glWwNCSJShhQv549JdbXUm0l16UIytAl4eJ87x
	bByp0RxnhNy5UzGN6gPExTy8lX0exeDGKx6fE6A4pt6wAEkgLtaQIrhDOvSCc/BIw5Rkq4PMNXO
	XCzPJIP7TlstwRvhjlK2Jb3G8oNmgJaHFJcFP6ZC/4Tk6YPb4LTReQtVQ8X4QATWl9G9udN2mUk
	cOTHcV2no2/USGupuBNrRWRcpbquGc0qAV8k7EIWa1hjZ2x9cyI5UJxlw34+W2uXtGmO+RYHoLl
	N//xksyBVDB/2SeWCUbPSCwsqL7BJk7exUHSGtHSMgIcNMa34CdXl/2+b81bO9cvcIyNgM8KLjj
	J+P9bM06rZrqh9UbfaqGMEcYfRR7wugiQctzsMdIYYY5/7d6mQG+yonx3PyEZFqaLOyoxh8dSEJ
	ZKBm+qRrqWOfUXPZC4r2wd252nMPHa7q9Z893ARSiRzN7T7ZwK0N7QgtTYlH7cjf7iJS84sWF6y
	GaeKSizeFFiFqRL5Fc0oGoQFQ5G6T8bWoINo3GA4OIkoelBMktfSvYLt9P+ZAp/BG5k=
X-Received: by 2002:a05:6122:420e:b0:5cc:4a63:4a01 with SMTP id 71dfb90a1353d-5ee34a7a24fmr41526e0c.11.1794510501179;
        Thu, 12 Nov 2026 11:08:21 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3420b59dsm83263e0c.12.2026.11.12.11.08.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:08:08 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-998749fe872so137568241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:08:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFNLplJTGD6CXGAtW/ff8SgWphu6m0PIB8KO09tWe3LsXQsjoPXCWbvEENqvwY5uEDSWVZa2smXBEPciwAUHObZ@lists.infradead.org
X-Received: by 2002:a05:6102:c15:b0:7d2:8dd0:2eb with SMTP id
 ada2fe7eead31-7d64d6ed886mr73919137.8.1794510481935; Thu, 12 Nov 2026
 11:08:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:07:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
X-Gm-Features: AclHuK8l5OcVstuPYNpoHJ657hIuMQK5i9ySH9sE9lHb16H-lVuh0fnzCqi0JCs
Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_110823_730068_645ED3EF 
X-CRM114-Status: GOOD (  18.81  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 at 17:43, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel with ioremap() and
> copies from it without checking whether the mapping worked. If it
> didn't, the copy reads from an offset into the NULL page.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem() turns
> that into -EFAULT like any other short copy.
>
> Fixes: 4d5ade5b29c6 ("sh: kdump support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

