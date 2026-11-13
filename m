Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411FB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L4awukGn;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=cw2pXXDf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S3xHepTTAVm9e0c+I4Yy1yIlpEnalfmaWL87RSx29sU=; b=L4awukGnnfHyiu
	iZ7sc2yyLFiET1sJxsifer2PtIyS0NRHcKQrRWemKFMyNoL3K4fN3qVEWb42VAjwjm6ArTKONZk+P
	OEcdR818mKZWJIxx+g0EeX9zU1xGFxDnxwUJuBvsvD1Nmp6rD5VcrK+QBWvCdT3qH/fRp8QwBH7ya
	4WTaQ/p6N0KHju+AxfZPylblLp33jU0JVrzjmqsGrN5FpDnbOJ3AVzpRB57gkY0EoKwqJyMW2pvQC
	ydz37tgPfpkox1fBZhBQ9RgrrsgKReGiq6xfNDbAIUnDnqiprA5ItdfR2xiEfUG+qsunCnmXyjG9n
	aWLwEdjT6BuqYEbYXM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjdQ-0000000Bfnq-0VJu;
	Fri, 13 Nov 2026 05:15:36 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjdL-0000000BfnG-1fte;
	Fri, 13 Nov 2026 05:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794546927; bh=S3xHepTTAVm9e0c+I4Yy1yIlpEnalfmaWL87RSx29sU=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=cw2pXXDfPczqzqVVe33/PTlkp7nwEh2+sdrjXfoN7g0xXGYK5emLGT6XiwYwDLCFM
	 MSoW+UvB0yvYeGIfS7kqJPpJ6weINYDr6mEZC+TuxGpA040y4Gl14Mma3GwphW3N57
	 COp+QGP22fihX+SruyKFyhl2e2isrChHnwNoYAr0=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-XMAILINFO: OQac6g2KrvnW2iSWwmf6ohc8qhiL9C3TsNqbroi2fdR0HWZzFA1ovpBO7LEtZX
	 rsB/1LC5019MdcWDKoCznAOiL4XGKRih3rL1/iE5Q58GB4A9v2Jg4fgbWBnCMQwqDYvfdzPMrTKcC
	 5DAMkCWrIx/aDkJLX4sBT+r0FWckcT88xnMpoR4C/69Zr6e7p/mf3zWxGbSYQHOpD+TM7e31L/uYv
	 PksXX6RJYJOsuMOqZ06ykjngEsWzGk3oDxghGjtE8X2jVdRubINKXs5ONZSK64XQk5NfFpyypgPU5
	 kouGL2bGdXWArC2BhVo+z0C4y5JMtVeavBZhJ8gKNXQgArSGWA/+oXHNWy/n71jDT6mX7JuRtWMun
	 r9S3WrobTIE7NPGG08zB9LBkyAAJ7NkHtnSL404vmXarFa1LgVmxL/tdC12Y+xfL9hL3g0Z4xZcYU
	 c9cBqNpSQkm0TyypeieJ8zYlTA7OsZfuHWLyUlWiargVvqvzXxwsRc7x8i0PTbkRCOZQWmmpXpLH8
	 8nMl9W/v6uftxZCf0gMpQSYmJgClt/eEhWyou2ePCvjPYBK6Blw+i6seyQVvKfcyKoAKoyWclyDma
	 M3Ar2Ql55jPSBGg+9HvN/aLcgmX6pbilMnAosZIGo7zmBdwFYJwBEW30XdBly4sbXmIZCWMSN9Jjm
	 vu/+icjnDSKoz6p56zYeio10SmJHOzMrERw+sBg5AhWgoJm324II8qNaQ2DnncwLi5EfAFN89EIS9
	 DsC5O3HW9E2FpfcZjmYCgcTg1C9URXl92MFoM39HKnKLeWZymSG25CUl5F/RifMc10yyEZl5LPdPD
	 HXo7/lZEM6P1kVfmU7skxUEy/6Znq/cSmEai4DYL0+60b/Kxqa1HHDC1795g9XgZBhL1M6huXHlsg
	 CjTay+JkuCfB4J5ClevHRmWJILvZaoCa+75uW+NTRK+WKwBEKNUmWu2KcJC++vmM/cQWAIvRciwLL
	 DtlwqNZSa6gzlS+CMjj7CTAgr7z6aO/hJidESPpAHzhlR23Elods0f/LcOKtl2PegD4NSIzUR+lJf
	 5lwX+/NDXTLZtod7DlmzFMRu8sjxrCpFBHhNI
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?bmV0ZGV2LWJvdCtzYXNoaWtv?=" <netdev-bot+sashiko@kernel.org>
Cc: "=?utf-8?B?bWts?=" <mkl@pengutronix.de>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?bWFpbGhvbA==?=" <mailhol@kernel.org>, "=?utf-8?B?aGVpa28=?=" <heiko@sntech.de>, "=?utf-8?B?c29ja2V0Y2Fu?=" <socketcan@hartkopp.net>, "=?utf-8?B?ZGF2ZW0=?=" <davem@davemloft.net>, "=?utf-8?B?ZWR1bWF6ZXQ=?=" <edumazet@kernel.org>, "=?utf-8?B?a3ViYQ==?=" <kuba@kernel.org>, "=?utf-8?B?cGFiZW5p?=" <pabeni@redhat.com>, "=?utf-8?B?aG9ybXM=?=" <horms@kernel.org>, "=?utf-8?B?Y29yYmV0?=" <corbet@lwn.net>, "=?utf-8?B?c2toYW4=?=" <skhan@linuxfoundation.org>, "=?utf-8?B?cmR1bmxhcA==?=" <rdunlap@infradead.org>, "=?utf-8?B?d2c=?=" <wg@grandegger.com>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, 
	"=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtZG9j?=" <linux-doc@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: Re: [PATCH net v9 08/10] can: rockchip_canfd: serialize TX with bus-off and restart
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 13 Nov 2026 13:15:24 +0800
X-Priority: 3
Message-ID: <tencent_AD03F810B3FDBC9A3A69DA65641264469409@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261111-rockchip-canfd-restart-close-v9-8-6643f3825ba3@qq.com>
	<179452273462.488853.12444870521885218967@kernel.org>
In-Reply-To: <179452273462.488853.12444870521885218967@kernel.org>
X-QQ-mid: xmsezb41-0t1794546924twb3yiq29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_211531_768273_A35A5D62 
X-CRM114-Status: GOOD (  12.79  )
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

SGksCgo+IFtTZXZlcml0eTogTWVkaXVtXQo+IElzIGlycV9zdXNwZW5kZWQgd29ya2luZyBh
cyBhIGxvY2sgaGVyZT8KClRoZSBmbGFnIGlzIGFuIElSUSBlbnRyeSBnYXRlIHVzZWQgd2l0
aCBkZXZpY2UgaW50ZXJydXB0IG1hc2tpbmcgYW5kCnN5bmNocm9uaXplX2lycSgpLiBEdXJp
bmcgcmVzdGFydCwgdGhlIGRyaXZlciBtYXNrcyBhbmQgZmx1c2hlcyBkZXZpY2UKaW50ZXJy
dXB0cywgc2V0cyB0aGUgZmxhZywgdGhlbiBkcmFpbnMgaGFuZGxlcnMgYmVmb3JlIHJlaW5p
dGlhbGl6YXRpb24uCkluIHRoaXMgdHJlZSwgdGhlIElSUSBkZXNjcmlwdG9yIGxvY2sgdXNl
ZCBieSBzeW5jaHJvbml6YXRpb24gYW5kCmRpc3BhdGNoIG9yZGVycyB0aGUgZmxhZyBzdG9y
ZSBhZ2FpbnN0IGxhdGVyIGhhbmRsZXIgZW50cnkuIFRoZQpyZWxlYXNlLWNsZWFyIHB1Ymxp
c2hlcyB0aGUgaW5pdGlhbGl6ZWQgc3RhdGUgdG8gdGhlIGhhbmRsZXIncwphY3F1aXJlLWxv
YWQuCgpPcGVuIHNldHMgdGhlIGdhdGUgYmVmb3JlIHJlcXVlc3RfaXJxKCksIHdoZW4gbm8g
cHJldmlvdXMgaGFuZGxlciBpcwpyZWdpc3RlcmVkLCBzbyB0aGVyZSBpcyBubyBvbGQgaGFu
ZGxlciB0byBkcmFpbiB0aGVyZS4gVFggYW5kIHRpbWVjb3VudGVyCnN0YXRlIGhhdmUgdGhl
aXIgb3duIGxvY2tzLiBUaGUgQkVDIGdldHRlciBpcyBvdXRzaWRlIHRoaXMgSVJRIHByb3Rv
Y29sOwppdHMgY2FjaGUgc3luY2hyb25pemF0aW9uIGlzc3VlIHByZWRhdGVzIHRoZSBwYXRj
aC4gSSBoYXZlIG5vdCBmb3VuZCBhCmNvbmNyZXRlIG5ldyByYWNlIGluIHRoaXMgc2VxdWVu
Y2UgdGhhdCB3YXJyYW50cyByZXBsYWNpbmcgdGhlIGdhdGUgd2l0aAphbm90aGVyIGxvY2su
Cgo+IFtTZXZlcml0eTogTG93XQo+IElzIHRoZSBDQU4gY29yZSBrbm93biB0byBiZSBvdXQg
b2YgcmVzZXQgd2hlbiB0aGlzIElOVF9NQVNLIHdyaXRlCj4gYXJyaXZlcz8KPiAuLi4KPiBT
aG91bGQgdGhlcmUgYmUgYSBzaG9ydCBzZXR0bGUgZGVsYXkgYWZ0ZXIgZGVhc3NlcnRpb24s
IG9yIGEgY2hlY2sgb2YgdGhlCj4gcmVhZC1iYWNrIHZhbHVlPwoKT24gUkszNTg4IHJldjIu
MiwgSSB0ZXN0ZWQgMzAwIHJlc2V0IHNhbXBsZXMgcGVyIGNvbnRyb2xsZXIsIDYwMCBpbiB0
b3RhbCwKY292ZXJpbmcgb3BlbiwgY2xvc2UgYW5kIGRpcmVjdCByZXN0YXJ0IGNhbGxiYWNr
cyB3aGlsZSBpZGxlLiBUaGUgdGVzdHMKcHJlc2VydmVkIHRoZSBwcm9kdWN0aW9uIG9yZGVy
OiBkZWFzc2VydCwgd3JpdGUgMHg3ZmZmLCB0aGVuIGZpcnN0CnJlYWRiYWNrLCB3aXRoIG5v
IGV4dHJhIE1NSU8sIGxvZ2dpbmcgb3IgZGVsYXkgYmVmb3JlIHRoYXQgd3JpdGUuIEV2ZXJ5
CmZpcnN0IHJlYWRiYWNrIHdhcyAweDNmZmY7IGJpdCAxNCBjb25zaXN0ZW50bHkgcmVhZCBh
cyB6ZXJvIGFuZCB3YXMgbm90Cm1pc3Rha2VuIGZvciBhIGxvc3Qgd3JpdGUuCgpUaGVzZSB0
ZXN0cyBmb3VuZCBubyBsb3N0IGZpcnN0IG1hc2sgd3JpdGUgb3IgZXZpZGVuY2UgdGhhdCB0
aGlzIGNoYW5nZQppbnRyb2R1Y2VzIG9yIHdvcnNlbnMgdGhlIHN1c3BlY3RlZCBwcm9ibGVt
LgoKQmVzdCByZWdhcmRzLApDdW5oYW8gTHUK


