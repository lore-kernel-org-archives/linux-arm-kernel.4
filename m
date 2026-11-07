Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E48606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 03:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mbnEjsn6;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=MDRyLQRw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+NfG3aoVVDYg320wMNuDSmqyNFEaM7V/GRWW/LuOKlc=; b=mbnEjsn6RkiGbH
	jBykbWzBLrbbOnjc9tQ3jYYZIZHixwy3LF0uPjB5bjOa5DQoji09iq5jcALehnK7V+C3WrAeG/bjl
	tGoLzCCwgsOa+85VNQUZ625V4a6jgaSkrfvI4z2sgZkaAURkDvh6XSrh7sT16HKKeVYzhL+ym9gR+
	P2MfBkZPXt5SaiJQFYvb3I+raxUDIVX95yIUnFr0c5gl71883YHwpuDTh+PslLr15lNkLjIl3/u/e
	21K2pej7kLiKFYMbbOxNsLUGpuwkOcl9RVxnsP80btvAr7y4SIWDYBXq/KEFNuAtmBN32qPHQFrFg
	tO9CpUSQi1xpJXVTJsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWch-0000000E6o4-2DNI;
	Sat, 07 Nov 2026 02:57:43 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWcb-0000000E6n7-30Yn;
	Sat, 07 Nov 2026 02:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794020248; bh=+NfG3aoVVDYg320wMNuDSmqyNFEaM7V/GRWW/LuOKlc=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=MDRyLQRweWcf+xUdMyrRKSmQ4ym8LxPSKGEuTbq8sda/LnBrQsChWSTv29ATNeLl1
	 5kWV0jo2YqJvU6DKgoUr+AJrGje3BPSoyvyrUwYRyCseF+TMcqFg43W8vPcKoVyG/T
	 IgribdMGCx+0gdmxzvXarCy4BkxVGjuwgdB5/LrI=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-XMAILINFO: MdmyWVu0InhASiUkhb//VhxE+kD9CHxdhJTc2eGlkCfKL+hSZzxtKPiKVMWgqY
	 Lv/UzTv+iDbo7dMZuvj8UN+79ox9/cI1AEMe33S2r7bt3E1M7gv8SGTY9I6pqBky60sk3/mm0O29D
	 v0tNVj8tRScQbUZinQwt1KFWKmyu1mcSFjpMRKY99eqQ2XcKYoS2kJBZ4JXHIhrufiW9AK7duvXRg
	 KsCUp8IMW+hWAen10Hz/NonxkHKmrw8902WefN6BT2pi5LZRVi6hT0uRjYwpmCFaBwOCVjazaFZkW
	 wEvJ2oVheUjYu7K2SVD3dwVH3rg8F1Ym9357Bt5Beoc/RzPFu25LZVECBn5HSGTziBRNIiIuN0BYv
	 dEY1lbfOgnkbsHmmhhBbM8zSlEo/FBbqBSFXTl0VIE558t1XIs5A0mDldpoYzntiRPQJhZW5ZJhQ+
	 aXfkpv1h/TX3CVwZKdOX088TERlmDzC1alWuo2aXUMAqKmn5cyZEA2Wx1M+jtxE7XQ9k+lBvG+1l3
	 Zq1Zh1i3lLMsxAXOGVv4s+FAEJn+M52EhPVreYm8frXOB6zR9f9VIq7AEjHL1lVVAPiG/jnSsdK8g
	 gl2D5ZEXeGnzyuJvVRK3zNJas9038c4pPTfTWudT0QbHKHcaiCsMBWWtcjr37NAAuyBE3cDToy1Ye
	 f/fPG5YwGmKcivHs3GSJKCOilYZAH/0NjqGLv3nOMYkIHgSrD4VBqR216mgFGUrYRlRoIglr8SnBX
	 Vwd9JgaaP0nTboNq8nqGOxkpMXE3N/smmQPyKgVHltVRYPhEjlLCfRnQDg5ahGRRGyn5xfrQC8gxe
	 1s2Xm/45nDEHVn54Il7wDgGZkucaaWxag1IMmsMYB5qNw+XLMaJV3txEO+bkf7nIXCmNSp5T74x47
	 JWyeAwNoPjkPUyKjUhtMl566EFDTKOjES7UsQlzb9uxvGRMYCqArnqRcqrnsawcwhe1woh2u7iiVl
	 juAaZyli3jPdvYY9zMs7UVjONkCX33DbPmQFGSBmrAvtZ92wlRp/O2VU0cnkVetSzWwX5d04zH20e
	 1OGx3SKWYgTJfYdLdBm+X0RZ6S74lhVe/Wnze8B3OhuP+NB45fbHc/8kqfCjn4GsLlGU6WyVm2SDO
	 tfRx5hWc/qYBDj4PUGmY2/bZ
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?SGVpa28gU3TDvGJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>, "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?RGF2aWQgUy4gTWlsbGVy?=" <davem@davemloft.net>, "=?utf-8?B?V29sZmdhbmcgR3JhbmRlZ2dlcg==?=" <wg@grandegger.com>, "=?utf-8?B?T2xpdmVyIEhhcnRrb3Bw?=" <socketcan@hartkopp.net>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?RXJpYyBEdW1hemV0?=" <edumazet@kernel.org>, "=?utf-8?B?SmFrdWIgS2ljaW5za2k=?=" <kuba@kernel.org>, "=?utf-8?B?UGFvbG8gQWJlbmk=?=" <pabeni@redhat.com>, "=?utf-8?B?U2ltb24gSG9ybWFu?=" <horms@kernel.org>, "=?utf-8?B?Sm9uYXRoYW4gQ29yYmV0?=" <corbet@lwn.net>, "=?utf-8?B?U2h1YWggS2hhbg==?=" <skhan@linuxfoundation.org>, "=?utf-8?B?UmFuZHkgRHVubGFw?=" <rdunlap@infradead.org>
Cc: "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?bGludXgtZG9j?=" <linux-doc@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: Re: [PATCH net v7 0/7] can: fix bus-off restart and device close races
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 7 Nov 2026 10:57:26 +0800
X-Priority: 3
Message-ID: <tencent_B3369A1199D0849091BB8015C41BBFF0A607@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261106-rockchip-canfd-restart-close-v7-0-accdb11bc845@qq.com>
	<16255046.uLZWGnKmhe@diego>
In-Reply-To: <16255046.uLZWGnKmhe@diego>
X-QQ-mid: xmsezb41-0t1794020246tqmnr7ex0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_185738_317039_748B0121 
X-CRM114-Status: GOOD (  18.90  )
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

SGksCgo+ID7CoFRoaXPCoHNlcmllc8KgZGVwZW5kc8Kgb27CoHRoZcKgdGhyZWXCoHBhdGNo
ZXPCoGluwqAiY2FuOsKgc2tiOsKgbWFrZcKgQ0FOwqBza2IKPiA+wqBmcmVlaW5nwqBzYWZl
wqBpbsKgYW55wqBJUlHCoGNvbnRleHQiwqBbMV3CoGFuZMKgdGhlwqB0aHJlZcKgcGF0Y2hl
c8KgaW7CoCJjYW46Cj4gPsKgcm9ja2NoaXBfY2FuZmQ6wqBmaXjCoFRYwqBzdGFsbHPCoGFu
ZMKgcmFjZXMiwqBbMl0uCj4gPsKgCj4gPsKgWzFdwqBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1jYW4vdGVuY2VudF9DRDA1RjAyMEJBRkIyNTM3RjVEMUY0Q0JCNDI1NTg4RUE4
MEFAcXEuY29tLwo+ID7CoFsyXcKgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2Fu
L3RlbmNlbnRfRTI1QzlCRTY2ODkyNjRFNDEzOEE0NjQ4MDNCODEwRkRGRDA5QHFxLmNvbS8K
PiAKPiBCb3RowqB0aGVzZcKgc2VyaWVzwqBhcmXCoGZyb23CoGp1bHnCoGFuZMKgc2VlbWlu
Z2x5wqBmcm9twqBiZWZvcmXCoHlvdcKgc3RhcnRlZAo+IHVzaW5nwqB0aGXCoGI0LXJlbGF5
LsKgU2/CoHRoZXnCoG1hecKgb3LCoG1hecKgbm90wqBoYXZlwqBzdXJ2aXZlZMKgdGhlwqBr
ZXJuZWwKPiByZWxlYXNlc8KgYW5kwqB0aGVpcsKgdGhyZWFkaW5nwqBpc8KgYnJva2VuwqBi
b3RowqBvbsKgbG9yZcKgYW5kwqBpbsKgYW55wqBtYWlib3gKPiB0aGV5wqBhcnJpdmVkwqBp
bi4KPiAKPiBBbmTCoGlmwqB0aGVyZcKgaGF2ZW4ndMKgYmVlbsKgYW55wqByZXNwb25zZXPC
oHRvwqB0aGVtwqBzaW5jZcKgdGhlbizCoEknZMKgdGhpbmsKPiB0aGV5wqBoYXZlwqBiZWVu
wqBsb3N0wqBvcsKgc28uCj4gCj4gU2/CoEknZMKgc3VnZ2VzdMKgcm9sbGluZ8KgYm90aMKg
eW91csKgZGVwZW5kZW5jaWVzwqBmb3J3YXJkwqBvbsKgdG9wwqBvZsKgdGhlwqBjYW4KPiB0
cmVlwqBhbmTCoHNlbmRpbmfCoHRoZW3CoGFzwqBhwqBuZXfCoHZlcnNpb24swqBzb8KgdGhh
dMKgcmV2aWV3ZXJzwqBjYW7CoGZpbmTCoHRoZW0/CgpUaGFuayB5b3UgdmVyeSBtdWNoIGZv
ciB0aGUgZ3VpZGFuY2UhIDotUAoKSSBqdXN0IGNoZWNrZWQ6IHRoZSAiY2FuOiBza2I6IG1h
a2UgQ0FOIHNrYiBmcmVlaW5nIHNhZmUgaW4gYW55IElSUQpjb250ZXh0IiBzZXJpZXMgd2Fz
IG1lcmdlZCBpbnRvIG1haW5saW5lIHllc3RlcmRheSwgc28gSSB3b24ndCBzZW5kIGEKbmV3
IHZlcnNpb24gb2YgaXQuIEknbGwgcmVtb3ZlIGl0cyBsaW5rIGZyb20gdGhlIGNvdmVyIGxl
dHRlci4KClRoZSAiY2FuOiByb2NrY2hpcF9jYW5mZDogZml4IFRYIHN0YWxscyBhbmQgcmFj
ZXMiIHNlcmllcyBzdGlsbCBoYXMgc29tZQppc3N1ZXMgcmVwb3J0ZWQgYnkgdGhlIGJvdHMg
ZHVyaW5nIHN1Ym1pc3Npb24gdG8gdGhlIG5ldCB0cmVlIHRoYXQgSQpuZWVkIHRvIGFkZHJl
c3MuIFNpbmNlIHRob3NlIHBhdGNoZXMgb3ZlcmxhcCB3aXRoIHRoaXMgc2VyaWVzLCBJIHBs
YW4KdG8gZm9sZCB0aGVtIGludG8gdGhlIG5leHQgdmVyc2lvbiAodjgpIGFuZCBzZW5kIHRo
ZW0gdG9nZXRoZXIuCgpCZXN0IHJlZ2FyZHMsCkN1bmhhbyBMdQoKcHctYm90OiBjcgoKCgo=


