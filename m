Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b9gc707S;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=uU1F9f6f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BG9vJP4tPF33GEesGxkQcQ8KBC+vLwkbRWXpiUkIsag=; b=b9gc707ShBvTjS
	2gHzGNxk5U/NPK4R2TCSr+kGoKZIpgMfyaLLN5bJ3q9E0s7A0QHqhhhfocn6mGI83hmXRQe+YNE6U
	pfiYflyh0ufAieflEYMg2SN26Z22jItlvZ0k7RsKxIp5e76zg1FObCkNB+ZO9GtAYKrWnXI4HdAtH
	WNGKljtcJrhBn+8TdwAVOZQtaw8tpS7gb6P6VJzETP46fnoyz2m3ZUtZKO+j8KMrkj7cIJOZYWK7M
	Tn0AguFqgZbISuxXGOzx+56AilXOY9vgosHk+GzHZdTM0c+A8pHuJZUcXfqVEJyj1yVHU04d7lYsK
	lSqMAc1XNc/MHywVgT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStM1-00000001pqa-25qP;
	Mon, 16 Nov 2026 09:50:25 +0000
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStLw-00000001ppz-1OQo;
	Mon, 16 Nov 2026 09:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794822617; bh=BG9vJP4tPF33GEesGxkQcQ8KBC+vLwkbRWXpiUkIsag=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=uU1F9f6fgn50NRe1QH6NcXZLTLRzjM3FhCPH0gq0PUfijZzImgudFgQb0K1OKxp9/
	 oGSlBG5Lf4aSN32U3Bl0dGHjQTbFMel5i+QWBzbtiCX/Ep87yBw/EaCU205K0wBkIW
	 xqrg7OCfoEfJtCkN/XjA+lmv8T0HxYYfZwE0CQdo=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: ObW7A5NPm3QRMO90WM0usk29kMol3NnPdW4jMcsZIk9TY6yhskAj4Fwsllv7h5
	 FdEyXo/oLqUejn5vFTMNz5ipMZNTjnWEth3088lDHKRJX9R6fPQiUhILx1bbGbL8xI+Cus45XAEuW
	 4kskzm3c/uMykjHGhIqo/BYXwP1N731DD5ICqZQSbwXleVQIn+uUEDk+mw5oW6Ww7qHf6zDwUGAbx
	 3s1Hh5fCw6nYA32qdJXy+lbuX6L716oLK+L6r/scInFG8XuqjcSDwzssEC8RWezZuOQROwTgcPdrz
	 LboUNIh2RmS0z6J3E+59bDsBWckP6sCrCTxXO/bUAiXET+shI9CetLJ/+6VXglGPfMMdxgiwmhaNB
	 EZzmTLw9GfmXb2x0du7oidjju4H9IyO9jnTeNsJd9orm94+xoNdprXvRU8lU9aY+X+AGPtLadzVtx
	 LdvA94+EWbzcWK9vxh5HqjBCzJ1EUUl4VeXt2lRARSKQROrYFy3uk1aOhi9wDAfa5YNgxzgTY8O4Q
	 eTSjPa5/pZ5ebyLRf6KkFzNF1vQnAQRchPLvn1zdAnbVqdrl6EAdeI1CZeOkjKwFS4ce8R0ou25tZ
	 gvVT5OfTUQhqPfG6O7QoShgQK+++n/YFyqvfjge6tnuLH9f0ffOOYDNiV1IKcBjWS8L3hivAM372F
	 mlPuUZzOh98nTRPErE/2siIPaR/Y6d/Ye2nzrw4HG+r/quZZO43qWS9yQwb42BcP/bu35Dwqy+s4+
	 4GOlqlbE67pmr09g7BHt2gF5Aa8dqNKf8OOYqzkksiPI+sXuvo+Qk9wFxTY1wgnDDxdhrYdzoYmz+
	 gyKbJa7CpB4THFTAONun+R/c9E/FlhkB7/FNguxVbPI0RrLUlThpABTGeh6Ogm888DxlqDBap5aps
	 y5N/AN7q2oBYUQ1RL2AuGV6xCg561ddt8iSWR3qb4w6u1TPrRFHd3n4WyrwKhiG+2KYd+PmOF/shU
	 tADDln39WtQn6NMCTnhYPMu59iJutv2Fqcp2TaC76byd5ek1vgGXLOPLVQOEQgD0Z0vLnuFI9ZxgU
	 uaWB2CDaR2MeljI//A1gbU+0CJEHFFD5qKFXzffGPLQM8nNvE6VFQ5IytkIq2p0+Kb4GZWrc9SymJ
	 0NjzUuF7j6lhTA==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?VWxmIEhhbnNzb24=?=" <ulf.hansson@oss.qualcomm.com>
Cc: "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?VWxmIEhhbnNzb24=?=" <ulfh@kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtcG0=?=" <linux-pm@vger.kernel.org>, "=?utf-8?B?RmlubGV5IFhpYW8=?=" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v4 0/2] pmdomain: rockchip: Add RK3572 power domains
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 16 Nov 2026 17:50:15 +0800
X-Priority: 3
Message-ID: <tencent_E7CC6902FE0862400DA2B35F4B93210D9606@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261104-add-board-ok3572-c-pmdomain-v4-0-15cf8b5a6e59@qq.com>
	<CAPx+jO_88-xLLiPeE1QPjceCBpBuX0ZXsB=-vVVcGmx_6vnWCA@mail.gmail.com>
In-Reply-To: <CAPx+jO_88-xLLiPeE1QPjceCBpBuX0ZXsB=-vVVcGmx_6vnWCA@mail.gmail.com>
X-QQ-mid: xmsezb41-0t1794822615t6y0ziur8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015020_697539_CAFCDDFD 
X-CRM114-Status: GOOD (  13.93  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgo+IFRoZXJlwqBhcmXCoHF1aXRlwqBhwqBsb3TCoG9mwqBwYXRjaGVzwqBvbsKgdGhl
wqByb2NrY2hpcMKgcG93ZXLCoGRvbWFpbsKgZHJpdmVyCj4gaW7CoHRoZcKgcGlwZS7CoE9u
wqBtecKgZW5kLMKgScKgY2FuwqBvbmx5wqB0cnnCoHRvwqBhcHBsecKgcGllY2VzwqBiecKg
cGllY2UswqBidXQKPiBpdMKgd291bGTCoGJlwqBuaWNlwqBpZsKgeW91wqBjb3VsZMKgc3Rh
cnTCoHJldmlld2luZ8KgZWFjaMKgb3RoZXInc8KgcGF0Y2hlc8KgdG8KPiBoZWxwwqBjb29y
ZGluYXRlwqB0aGlzwqBiaXQuCj4gCj4gQW55d2F5LMKgdGhpc8Kgc2VyaWVzwqBuZWVkc8Kg
dG/CoGJlwqByZWJhc2VkwqBvbsKgdG9wwqBvZsKgdGhlwqBsYXRlc3TCoGNoYW5nZXMKPiB0
aGF0wqBJwqBoYXZlwqBxdWV1ZWTCoGZvcsKgbmV4dC7CoEnCoHdpbGzCoGhhdmXCoGHCoGxv
b2vCoHdoZW7CoHRoYXQnc8KgZG9uZS4KCkkgaGF2ZSByZWJhc2VkIHRoaXMgc2VyaWVzIGFu
ZCBpdHMgcHJlcmVxdWlzaXRlIHBvd2VyLW9uIHJvbGxiYWNrCmZpeCBbMV0gb250byB5b3Vy
IGxhdGVzdCBuZXh0IGJyYW5jaCAoNmY1YzhlYzkzMDJjKS4gQm90aCByZWJhc2VkCmNsZWFu
bHksIHdpdGggbm8gY29uZmxpY3RzIG9yIGZ1bmN0aW9uYWwgY2hhbmdlcy4KClNob3VsZCBJ
IHNlbmQgbmV3IHJldmlzaW9ucyBvZiBib3RoICh2NSBmb3IgdGhpcyBzZXJpZXMgYW5kIHYy
IGZvcgp0aGUgcm9sbGJhY2sgZml4KT8KClsxXSBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsv
MjAyNjExMDEtZml4LXJvY2tjaGlwLXBtZG9tYWluLXBvd2VyLW9uLXJvbGxiYWNrLXYxLTEt
NTlhNDU3ODNlMzNlQHFxLmNvbQoKQmVzdCByZWdhcmRzLApDdW5oYW8gTHU=


