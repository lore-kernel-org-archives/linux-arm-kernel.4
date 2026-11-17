Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E475606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bg4bH6/K;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QdLWeOj+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4adGshk3DcGvhqFeQZWKT+ilTqCtanGq6mRdY2JYAuk=; b=Bg4bH6/K7cF8YG
	r6+aslfFWSodKo3OUR9qshHhjciaOMMNn8kN3de7ckEMbmNnQ2nQVWuOvV1y3r685cUldSaTO+svY
	AP/uE75oVKKqfIpzV9Z90IXZE5sUVe3h8wWLtLtdMr+7wF5rlpA0KLUoFJhBi5ilnM0Mb+N8Zm229
	pES7oN2ZQyhfOdnm5NOSnG3GLx+OZy8nfh8sBFQZMkMMQBJvi/fT0f6QaoFnlpyHi1PYQaAmnspyP
	XoSrq1Jht6VV2gMc4eyIKkSRZFZNypTeDAbp12ohV59VzFqHSmKdMsKcIlCVU73L3gGT1zGaXsk7X
	H8UlMv7LMivAbDo3lqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ2y-00000005t0L-3TyX;
	Tue, 17 Nov 2026 13:16:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ2r-00000005sxr-0SXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:16:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so46040125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794921379; x=1795526179; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4adGshk3DcGvhqFeQZWKT+ilTqCtanGq6mRdY2JYAuk=;
        b=QdLWeOj+aecadOPt56GbXTSYOwnHuZ9quqsIOAUI5Pz4onANCO3ij0TvMgGD40IR8E
         CdesbWoxidws55O09v/HsZhCktW44ucfmsmePCdNxN5zSOWs4M/uj7mJIdStY8jEznDq
         uXdYWmTIWn8pX9Q4mF2Ujv/fQWMM1ir73k81EDqo1mQtiEtR6oKo+uC1+I2GwSKS29Lv
         D3MdAb2DoYp+A159G7UAOtCcZbB1yA+Q5PfrU4U2SAsniG9xmwqpgGBmHcCoz03PN2Zo
         IBkbJuZf8RVntWGT9vnXpNdESVpS77dS+M6htfOcRqZSIsu4M24Xt3UoNX27hbZbaqiI
         89Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921379; x=1795526179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4adGshk3DcGvhqFeQZWKT+ilTqCtanGq6mRdY2JYAuk=;
        b=TxVD2o+j1nsZpfK84Z+Rmira4B+mmpq4Ubjx73vGnHruQ3Nf3+VQMkJbmgmO/7yJbz
         DrsAF4LGUnV7ehnul0TgYgOtkFYeJckHm5Ndv0aU6+LXS3Wf7NFda5W2gf7RobcQsoz5
         1VKwFE3f6Op9dZEAZLzwuS+drwxOyszIgS851H2jvex5GtuVuZES08l33pJVlNsI+UG6
         Qh4hq5YF/7QrsQ5JwNYakVr3yy5E8/pqM72STgJP5/I7kScJdHGiQoLue1UVn3yCE6Ah
         cIrlZa8HWSg90y0nB5aEJGdtKzVHLPW8NFN00fqkjDg5Xu9G+pz2GwGGYm2dEdE9BIzL
         cegA==
X-Forwarded-Encrypted: i=1; AL+hErE2pdwW1D6fj6SLe+AcGEGZx/7u8pE/eXHC6jJEdvPKgwTl8PoZdUtnSNefqpC1TsnjoHwBdgKZmMqh5+ocvtZl@lists.infradead.org
X-Gm-Message-State: APuU4Z8MT+s8pRLKGGX1JnIg0VW3ZV6LwAE7MoJd+TWPFkcXlN1dAQsT
	V3nHGkUfwng1T8UofqmiA2IGKDw0Qzva9tcsJEhoQxq8/zTHMStpCDj2
X-Gm-Gg: AYBFou3XEVEeefpYL0bz/XQDHl33La0N+aQB00+Xdvmj0BcCHfCWXpAokAa8G+X/VNx
	P/6pFW2xtEMmsJ7+I8AN/49egBlISidkKGhYtCn3NRkCasej3v44/6PIRsH1EqYGlkANf7zRo9B
	qPAwZO/n8/uzEh4wKmzuKE4trRVEr/UNZkM9kdYkNO1TrJxz/iD/kQkJr5tzewG2YbIQO7qwV6c
	qjHJIyPYs/I1+riFln9fLCyL+3JPHe5wbqZsHRMPp/bxAX1G4jsuKwCL/fFOH45fWUU0YY1s9uM
	U7To994uTpKj0ckkOjneOZeiTt2h8SZRvlw+jeGRUMsmiQTQh++my2LX7AU5t83huc/ShBI5Zkx
	9gnim7dFkdjn9mr03+bNrN6cFlBfrbgBeLOSMfDn3lnmHpjTgCBGFACkmO9Xwxwf+/ZC0iyli/j
	cNvPaLhk3o/reJudmVoUFTVXn6B92m72bnrct/HFhd2hOBA1eHSYjulIabFJWYG04fIkCGU1ryF
	slkax9Yfw6XswsbRHV3BQ6a/DiQ20uOgUwNJwLTnjjYc/x/PzptHmXctgL3XYvmjlP0q8R43/k3
	ATaAp7GKIaun/eat6JI2j9zF2dJ3/Tn2BNyfNpWMCdjKV5rU0adOgrCHWxljATzKNg==
X-Received: by 2002:a05:600d:3:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4bb55a50eacmr238269805e9.15.1794921378994;
        Tue, 17 Nov 2026 05:16:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm26817173f8f.21.2026.11.17.05.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:16:17 -0800 (PST)
Date: Tue, 17 Nov 2026 13:16:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>
Subject: Re: [PATCH] pinctrl: zynqmp: Ensure function names are NUL
 terminated
Message-ID: <20261117131616.0a631d5c@pumpkin>
In-Reply-To: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
References: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_051621_205663_35C5F2B2 
X-CRM114-Status: GOOD (  20.74  )
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 13:09:47 +0530
Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:

> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
> 16-byte field and does not guarantee NUL termination. A 16-character
> name fills the entire field.
> The driver copies this field into a 16-byte buffer and subsequently
> uses it as a C string. For a non-NUL-terminated name, string operations
> can read past the end of the buffer into the adjacent groups pointer.
> 
> Reserve an extra byte for the NUL terminator and explicitly terminate
> the copied function name.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  drivers/pinctrl/pinctrl-zynqmp.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> index aba129ead04c..c778133fadc2 100644
> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> @@ -29,7 +29,11 @@
>  
>  #define ZYNQMP_PIN_PREFIX			"MIO"
>  #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
> -#define MAX_FUNC_NAME_LEN			16
> +/*
> + * Firmware returns the name in a fixed-size field and does not guarantee a
> + * NUL terminator. Keep one extra byte for the NUL terminator.
> + */
> +#define MAX_FUNC_NAME_LEN			(PINCTRL_GET_FUNC_NAME_RESP_LEN + 1)
>  #define MAX_GROUP_PIN				50
>  #define MAX_PIN_GROUPS				50
>  #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
> @@ -650,6 +654,7 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
>  	 */
>  	zynqmp_pm_query_data(qdata, payload);
>  	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
> +	name[PINCTRL_GET_FUNC_NAME_RESP_LEN] = '\0';

Too many constants....
You might want to try embedding 'name' in a structure.

Then, at least, you can use sizeof().

David


>  }
>  
>  static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)


