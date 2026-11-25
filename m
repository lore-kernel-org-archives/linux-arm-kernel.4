Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C0606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MGqGCLjA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCLFlDB9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=; b=MGqGCLjAE3nGifEy3uXDdezsaU
	HwfHW2Ky9DVPc/5y4pUjxSuozH8oCrZc+5j99zGF9HoqBfb42DjD7IpeH2FS/3ZIRqJRnk+eWaIZW
	xrlDtCG+iSyah9pPa732ubD3PhKOR1mhDlLVr+Bz3wkA6iYwYBC88RboRs16JM4rul3LvL1XHcQxG
	jJCS2NHKJmyzVmxdy1FuoHdHSwLrehTDvR2pDLC0yGkWtfm6AfN7jwqU4YikBUcB+zbeYMeUG6LBd
	jgK2lp18PpPDw0+eovE5gx3U5ss6uXyXnKpg8n5elJ5FN8AlarC94zgX5aOmCG2vonfjF24t+Lnk3
	ldX2CjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB9N-00000009dS2-18pl;
	Wed, 25 Nov 2026 11:26:57 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB9J-00000009dQu-2c6z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:26:55 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso54468311fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606011; x=1796210811; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=UCLFlDB9GCrY8c97W9N8FGuJIJ/K6YfBqNI/b/mr4Vx/rHZBqRb7Ht7IbfDPUVT4Ql
         ReqFIixO4gs438L2T+iF/4da05Mt3ns9puhD0zGm/kXxkAUciJIoPMTZjaeKco1OF8xq
         1WR6ZXNR/Xw7nm5+mVlxR2k+iITouz0sHrYW1AT2neO2pjuRjeA5ztOy8mGQ5XQ93RzB
         1GodWKk8zK5BCVYQmt7f8fuwv7owOurKAT8w15rCXKIuYohPwtmwBKO9A7tWUiKNVFdJ
         1GmQd9L6NRYT2mE2lp7/OxDgFZvCFU5L5ba5AbrTp+uMsqB6xE6Tz6xqtCdUnFuSpakO
         iZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606011; x=1796210811;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=v9HAoq7KHOd731mKo7ht/MaoATfyD+OmWgI02ucdubpzqzPJlAGeYNxC9xwp8exeA6
         rwxPZg6weCkAOLWO7WjUyfqd4y/kZBDbkBS/miWbsyID6X6twetWT7vjRaScmtx+Aful
         969//9DXt/ZngrXP8YJe0+VmwiJeqvBU8ldBlCorUR0JimDYxu8z7gtqYObYy35jLMr9
         NF5CWQ+2XxFWsaglSvcOkAUN46XtWJ6B2MD2RHjoOCvAk9J8sdWduEwN9NAs0BNwp6zJ
         qNmRKqtfWIgVaJkLAo/dhIRMpFdRna9+lJl00z50I1yNm4oz52gXZiIAq6XnOd3OHwxX
         1b/A==
X-Forwarded-Encrypted: i=1; AL+hErE4p1qib9UETPr08YY6z/84BxGtHmQ2bQsCyXXXnFD4pdUkdCqmNZ+p/4YlLmn5+J9KtN5405DZIV5zihWratud@lists.infradead.org
X-Gm-Message-State: APuU4Z864NkTbGMzs7HMlLEeShHs2Tf/NqL+wkf08hG80alVaAVt2++X
	5BrM8pJK49Q9hEgEcoNmmhbcojwXfA6sSpYFHkXLK3pNgJVWULhBBl7w
X-Gm-Gg: AZFdTZeiqvoFQIcGyFdwKvq0h181uFNVXCiL4KPd01Fyoi9UzUk7wL/kr0/r0Vkueq/
	Dv7oczeQYkekZ8/Hgq12tSjDCoTLhXDPtQZGXWK9ob48kbYwuOQz0ZeIMMs0nfpVMTEgNdKLyxE
	BITprTRi5GHOZPIPBIjbQ+9ZlMeT/vWhSPIGkAXN4UG5vXgJgmTNwuCpzHzdtEir8/8Xd7GX6Mn
	0mvpeijQNxyoZs3HXS1mP7Jfq8Ca+pIOdcJvbVy0U9eUaNtQfqaLiO7QAoUYHKJ1Omm3MIKGbm6
	iaABWSV4YdurOnDLJ95LBu03K28SRR5IJesC8+2dFzPvEb6x+h+DDrxCd7znjvSh4BNlSPXNRVs
	xeBybBMsfpMPZqqYxCTV9NEcohl3Cc5iplsfjXDmL6ui+NHBpjUlnAcR30SibGobQIa5TVOEP+3
	TXiTkD7BV5q8sbkwjRd+CrmZAUu5qoyzZAkuHg4jAGvdwoiXMRvT7oPBR10PKMUDuuI4I/9H2Zm
	9V+HEpnU72ydd/f9upaIbbt0UuE+zUbkBcQjzkwvSyfJpyurKgAC6q9qEMtmCURYjeF1x0/H88Q
	HnjTJZaxQsYJ3tYy28RLF1SCGUC9i9gvj0a4ccyqUPrKqioilzHn9M4=
X-Received: by 2002:a05:651c:b28:b0:39c:624d:82b9 with SMTP id 38308e7fff4ca-3ae7f9a073amr54848531fa.4.1795606011279;
        Wed, 25 Nov 2026 03:26:51 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e3c4sm46556431fa.4.2026.11.25.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 4/6] reset: Add Cortina Systems CS7542 global reset controller
Date: Wed, 25 Nov 2026 14:26:28 +0300
Message-ID: <179560598858.3.3579752078270188660@gmail.com>
In-Reply-To: <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
 <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
 <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_032653_671155_63BBD27A 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
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

Hi Philipp,

Thanks. I've switched the allocation in cs7542_reset_probe() to
devm_kzalloc_obj(dev, *rst) for the next revision.

Best regards,
Fil

