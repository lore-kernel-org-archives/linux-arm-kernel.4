Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I1k3H5EM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5IyhzGyIxYOi3t2YGcbqYhYuriy/+clO3cBCQRk/OnU=; b=I1k3H5EMLBYp47f4jRAHJL7GY1
	kLtycFtIcaQ1bktDnHbWhdPEVN0qB0+MvKnXnk4xddWIJCtik0KGm+erZ5T9UEJR54Bi54HMXQYQJ
	RCp8ay1DXTWL/l3L4IK4wKvrXQNBUtS6Bmi43iuEGmiSxOtSOiA0l2cUeBsss7C2f0b8SP9Ym7Upv
	E+aMU6ESySnreaj3/bPRlIxqPkooAFr3BaVz7XF6bc7Y3SqGKINQIW4b6ZkvGSwFAJfKuRoZYc3qr
	NfpAkiqfl/kqXUU7gShUQqtoLSYpfyDcDFPNZq5Os4uFj8Ef4VP0rir+3xr33R+xL4adpJ3pq3VBX
	mjVsbMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN0i-00000002LXa-1vOz;
	Mon, 23 Nov 2026 05:54:40 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN0c-00000002LWv-0xlz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:54:38 +0000
EX-QQ-RecipientCnt: 9
X-QQ-GoodBg: 2
X-QQ-SSF: 0040000000000040
X-QQ-FEAT: D4aqtcRDiqSC4cSopMKx95/hNecL9n5F2uEmFqbUjlE=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: EQlCO5nOxNv9I/hMmIffUYxB9JojWH184R09rMRmxrQ=
X-QQ-STYLE: 
X-QQ-mid: v3sz3b-12t1795413222ta0bb2a36
From: "=?utf-8?B?6buE5Y2O5oiQ?=" <1112433017@e.gzhu.edu.cn>
To: "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>
Cc: "=?utf-8?B?Y2F0YWxpbi5tYXJpbmFz?=" <catalin.marinas@arm.com>, "=?utf-8?B?d2lsbA==?=" <will@kernel.org>, "=?utf-8?B?bWFyay5ydXRsYW5k?=" <mark.rutland@arm.com>, "=?utf-8?B?YnJvb25pZQ==?=" <broonie@kernel.org>, "=?utf-8?B?c3phYm9sY3MubmFneQ==?=" <szabolcs.nagy@arm.com>, "=?utf-8?B?eXVyeS5raHJ1c3RhbGV2?=" <yury.khrustalev@arm.com>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: [PATCH 0/1] arm64: gcs: bind signal GCS restore to the live GCSPR_EL0
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 23 Nov 2026 13:53:42 +0800
X-Priority: 3
Message-ID: <tencent_6173029B43F227BE37E581FB@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-BIZMAIL-ID: 7685960821630635312
X-Address-Ticket: version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Mon, 23 Nov 2026 13:53:43 +0800 (CST)
Feedback-ID: v:e.gzhu.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OQm4EXGVKR2OM3m5Ss1r3vtoh/ta2tsyuwWU3YjjDsnqYgmPDDozM2nT
	almSglRmRT5Hq1Pf9fUEe37krdnm+yY9fMcH1PqqqWUSpAwSmHYSgxSWaxvvZByOz7rZsUC
	ULpFjd3+tILtoS2NFTMS3C+cr3/IUjx/e3u1CfniVWhl7zOVQ9zcpdP2/XrkLvoir/sCiTi
	/DwK0JlqxVqlwZvVk+hihiFm+guJ6oKS4pi33MOo0INmrP05i+TtZ47+oK0JmwAqjWmhoXe
	hTcZIvqqMO6SJFqZB+FDfwIfv+j4Dl/h9h4LEWJpf6YR6Pq5NhgEddeU3h5RPEZ5RZpwRui
	9nM/MumQu39wWlR0x1ph2LI22hKnf8xonvH5Izk/7A7FQu63zjSwGe4N/CzKeAzMvlK1P1f
	klScjF5amV+B8BI4gQ5aKiGJDwPfKndiiWVIzW276w929UFwZlIZeWzIk/vP/7cPvijuDe0
	qXV5WOoWDcbJ9EaOEipYNRtrwfZ7AbUlt5XiqbZjIl5SRUQPtO27fvAOJhTKI/o+rK6OR3X
	9ixhNUW5p5DS52LOE93ER4iSVt9lzukFFqVvSo6a09vN31NitRRuuuiaqm2nAndSJvfG2yp
	hesVaDkVuO5ObmFo81uo6PhRNWrm5+T1BRMg3hUCVCdzZos9tXCzzYGfdJLrcnGtvdEC+7J
	A/Kaw6yIW2L9ZLKZr2aqVXrK0uvICwbT5FKVzBIa2EuHEhWnoVQXzgcPhRkgYDU9I/meawE
	vpWbFoks60J0720d4ejmH/4xtP4EVGoeH6+yIpwO7FQ0JDPOeBdigvIS26/4BsUc54TKqj4
	k+IODE7pchynWG2L8yqoSIqcJWrXTDU2Gs0fMmhTAQ0prD/w3KDh1RD7o4rcUlNBI0jIQTo
	WI6hZ/Dm22F3CWhSh5fQX24fZgS78uXokFGE5dQp0pLBFu6FFwuo3M4um5/95EZBdH8qOgK
	mzgqai7WoVgWkLnoq0iDGt7quGBB7MKuebrVhTvpvAg91aA==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_215435_739029_5E267BE0 
X-CRM114-Status: GOOD (  15.84  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sDQpXZSBhdWRpdGVkIHRoZSBhcm02NCBHQ1Mgc2lnbmFsLXJlc3RvcmUgcHJvdG9j
b2wgYWdhaW5zdCB4ODYgQ0VUIGFuZCB0aGUgUklTQy1WIHVzZXJjZmkgaW1wbGVtZW50YXRp
b24gYW5kIGZvdW5kIHRoYXQgcmVzdG9yZV9nY3NfY29udGV4dCgpIGFjY2VwdHMgYW55IGdj
c3ByIGZyb20gdGhlIHVzZXIgc2lnbmFsIGZyYW1lICh0aGUgaW4tdHJlZSBjb21tZW50IHN0
YXRlcyAiV2UgbGV0IHVzZXJzcGFjZSBzZXQgR0NTUFJfRUwwIHRvIGFueXRoaW5nIGhlcmUs
IHdlIHdpbGwgdmFsaWRhdGUgbGF0ZXIiKSwgYW5kIGdjc19yZXN0b3JlX3NpZ25hbCgpIHRo
ZW4gdmFsaWRhdGVzIG9ubHkgYSBzZWxmLXJlZmVyZW50aWFsIHZhbHVlIHJlbGF0aW9uIGF0
IHRoYXQgYWRkcmVzczpjYXAgPT0gR0NTX1NJR05BTF9DQVAoZ2NzcHIpLiAgQSBzdGlsbC1s
aXZlIHNpZ25hbCBjYXAgYmVsb25naW5nIHRvIGEgZGlmZmVyZW50LCBuZXZlci1yZXN0b3Jl
ZCBzaWduYWwgY29udGV4dCBzYXRpc2ZpZXMgdGhpcyBieSBjb25zdHJ1Y3Rpb24uDQoNCkNv
bnNlcXVlbmNlOiB3aXRoIGEgbWVtb3J5LWNvcnJ1cHRpb24gcHJpbWl0aXZlIHN1ZmZpY2ll
bnQgdG8gY29ycnVwdCBhIHNpZ2ZyYW1lICh0aGUgdGhyZWF0IG1vZGVsIHNoYWRvdyBzdGFj
a3MgZXhpc3QgZm9yKSwgYSBuZXN0ZWQgaGFuZGxlciBjYW4gcG9pbnQgaXRzIG93biBmcmFt
ZSdzIGdjc3ByIGF0IHRoZSBvdXRlciBoYW5kbGVyJ3MgbGl2ZSBjYXAuICBUaGUga2VybmVs
IGFjY2VwdHMgaXQsIHplcm9lcyB0aGUgb3V0ZXIgY29udGV4dCdzIGNhcCwgYW5kIHJlc3Rv
cmVzIEdDU1BSX0VMMCB0byB0aGUgYXR0YWNrZXItY2hvc2VuIHBvc2l0aW9uICsgOCAtIGEg
a2VybmVsLW1lZGlhdGVkIHJld2luZCB0byBhIGhpc3RvcmljYWwgZGVwdGguICBXZSBkZW1v
bnN0cmF0ZWQgdGhlIGZ1bGwgY2hhaW4gb24gUUVNVSBUQ0cgRkVBVF9HQ1Mgd2l0aCB0aGlz
IGtlcm5lbCB0cmVlICg5LWFybSBwcm9iZSwgNSBydW5zIGVhY2gsIGZ1bGx5DQpkZXRlcm1p
bmlzdGljKToNCg0KICBBMS9BM0MgIG5vcm1hbCArIG5lc3RlZCBsZWdpdGltYXRlIHJvdW5k
LXRyaXBzICAgICAgICAgICAgOiBQQVNTDQogIEEyICAgICAgZnJhbWUuZ2NzcHIgKzggdG8g
YSBjYXBsZXNzIGFkZHJlc3MgICAgICAgICAgICAgICA6IGtpbGxlZA0KICAgICAgICAgICh0
aGUgdmFsdWUgY2hlY2sgZXhpc3RzIGFuZCB3b3JrcykNCiAgQTMvQTUgICBjcm9zcy1jb250
ZXh0IHN0YWxlLWNhcCByZXdyaXRlIChBNSBsb2NhdGVzIGl0cyBvd24NCiAgICAgICAgICBm
cmFtZSBieSBzdGFjayBzY2FuIG9ubHkgLSBubyBwcml2aWxlZ2VkIHVjb250ZXh0DQogICAg
ICAgICAgcG9pbnRlciwgdGhlIHJlYWxpc3RpYyBhdHRhY2tlciBtb2RlbCkgICAgICAgICAg
ICA6IEdDU1BSDQogICAgICAgICAgcmV3b3VuZCwgY29udHJvbCByZXN1bWVzIGF0IHRoZSBh
dHRhY2tlciBkZXB0aCwgNS81DQogIEE0ICAgICAgdGhlIHN0b2xlbi1mcm9tIG91dGVyIGhh
bmRsZXIncyBsYXRlciBzaWdyZXR1cm4gICA6IGtpbGxlZA0KICAgICAgICAgIChpdHMgY2Fw
IHdhcyBjb25zdW1lZCBieSB0aGUgdGhpZWYpDQogIEE2ICAgICAgZnVsbCBDRkkgYnlwYXNz
OiBhZnRlciB0aGUgcmV3aW5kLCBhIGRlbGliZXJhdGUNCiAgICAgICAgICBsZHIgeDMwLzxS
QT47IHJldCBwb3BzIHRoZSByZXdvdW5kIHNsb3QgYW5kIGlzDQogICAgICAgICAgQUNDRVBU
RUQsIHJldHVybmluZyBhdCBhIGhpc3RvcmljYWwgcmV0dXJuIGFkZHJlc3MNCiAgICAgICAg
ICBhbmQgc2tpcHBpbmcgdGhlIHJlc3Qgb2YgdGhlIGFuY2hvciBmdW5jdGlvbiAtIDUvNSwN
CiAgICAgICAgICB3aGlsZSB0aGUgaWRlbnRpY2FsIHJldCB3aXRob3V0IHRoZSByZXdpbmQg
aXMga2lsbGVkLg0KDQp4ODYgQ0VUIGRvZXMgbm90IGhhdmUgdGhpcyBzaGFwZSAoaXRzIHNp
Z2ZyYW1lIGNhcnJpZXMgbm8gU1NQIGZpZWxkKTsgUklTQy1WIHVzZXJjZmkgaGFkIHRoZSBz
YW1lIHNoYXBlIGFuZCBhbiBlcXVpdmFsZW50IHNpeC1saW5lIGJpbmRpbmcgaGFzIGJlZW4g
cHJvcG9zZWQgdGhlcmUgaW4gcGFyYWxsZWwuDQoNClRoZSBwYXRjaCBiaW5kcyB0aGUgZnJh
bWUncyBnY3NwciB0byB0aGUgbGl2ZSBHQ1NQUl9FTDAgKGVxdWFsaXR5OyBwaW5uZWQgZW1w
aXJpY2FsbHkgYXQgemVybyBkZWx0YSBmb3IgZXZlcnkgbGVnaXRpbWF0ZSByZXN0b3JlIGF0
IGV2ZXJ5IG5lc3RpbmcgZGVwdGggLSB0aGUgaGFuZGxyJ3MgcmV0dXJuIHBvcHMgaXRzIHRy
YW1wb2xpbmUgcmVjb3JkIGJlZm9yZSBydF9zaWdyZXR1cm4pLiAgVXNlcnNwYWNlIGNhbm5v
dCBtb3ZlIHRoZSBsaXZlIEdDU1BSX0VMMCB3aXRob3V0DQpleGVjdXRpbmcgR0NTIGluc3Ry
dWN0aW9ucywgd2hpY2ggYXJlIHRoZW1zZWx2ZXMgcG9saWNlZC4NCg0KQ29tcGF0aWJpbGl0
eSBldmlkZW5jZSAodGhlIHF1ZXN0aW9uIHdlIGV4cGVjdCBmaXJzdCk6DQoNCiAgUjEtUjMg
IG5vcm1hbCAvIG5lc3RlZCAvIHNpZ2FsdHN0YWNrIHJvdW5kLXRyaXBzICAgICAgICAgICA6
IFBBU1MgYm90aA0KICBSNC1SNiAgcmF3IChub24tR0NTLWF3YXJlKSBsb25nam1wL3NldGNv
bnRleHQvc3dhcGNvbnRleHQgIDoga2lsbGVkDQogICAgICAgICBvbiBCT1RIIHVucGF0Y2hl
ZCBhbmQgcGF0Y2hlZCBrZXJuZWxzIC0gYXJjaGl0ZWN0dXJhbA0KICAgICAgICAgR0NTIGJl
aGF2aW9yIChyYXcganVtcHMgdGhhdCBza2lwIHNpZ3JldHVybiBhcmUgZXhhY3RseQ0KICAg
ICAgICAgd2hhdCBHQ1MgcmVqZWN0cyk7IHRoZSBwYXRjaCBhZGRzIHplcm8gYmVoYXZpb3Jh
bCBkZWx0YQ0KICBSNyAgICAgR0NTUE9QTSB1c2Vyc3BhY2UgdW53aW5kIC0gdGhlIHByaW1p
dGl2ZSBnbGliYydzIEdDUw0KICAgICAgICAgc2VyaWVzIGFjdHVhbGx5IHVzZXMgZm9yIF9f
bG9uZ2ptcCAodjksIEtocnVzdGFsZXY6DQogICAgICAgICBNUlNfR0NTUFIgc2F2ZSArIEdD
U1BPUE0gcG9wIGxvb3AgKyBHQ1NTUzEvR0NTU1MyDQogICAgICAgICBjcm9zcy1zdGFjayBz
d2l0Y2gsIG5vIHJ0X3NpZ3JldHVybiBkZXBlbmRlbmN5KTogUEFTUyBvbg0KICAgICAgICAg
Ym90aCBrZXJuZWxzOyBvcmRpbmFyeSBsb25nam1wIGlzIG9ydGhvZ29uYWwgdG8gdGhpcyBw
YXRjaA0KICBSOCAgICAgR0NTUE9QTSBhdHRlbXB0ZWQgYWNyb3NzIGEgc2lnbmFsIGNhcDog
a2lsbGVkIG9uIGJvdGggLQ0KICAgICAgICAgdGhlIGFyY2hpdGVjdHVyZSBmb3JiaWRzIHVz
ZXJzcGFjZSBjYXAtY3Jvc3NpbmcsIHNvIG5vDQogICAgICAgICBsaWJjIGNhbiBieXBhc3Mg
c2lncmV0dXJuIHZpYSBHQ1NQT1BNOyB0aGUgb25seSBzYW5jdGlvbmVkDQogICAgICAgICBy
ZXN0b3JlIHBhdGggaXMgdGhlIGtlcm5lbCdzLCB3aG9zZSBsZWdpdGltYXRlIGZvcm1zIGFs
bA0KICAgICAgICAgc2F0aXNmeSB0aGUgYmluZGluZw0KDQpPbmUgc2VtYW50aWMgYm91bmRh
cnkgd29ydGggbmFtaW5nOiBhIHNpZ2xvbmdqbXAgdGhhdCBhYmFuZG9ucyBhIHN0aWxsLXBl
bmRpbmcgb3V0ZXIgaGFuZGxlciBmcmFtZSBsZWF2ZXMgbGl2ZSBHQ1NQUiBpbmNvbnNpc3Rl
bnQgd2l0aCB0aGF0IG91dGVyIGZyYW1lOyB3aXRoIHRoaXMgcGF0Y2ggc3VjaCBhIGZyYW1l
J3MgbGF0ZXIgc2lncmV0dXJuIGZhaWxzIHdpdGggLUVJTlZBTCBpbnN0ZWFkIG9mIHNpbGVu
dGx5IHJld2luZGluZyB0byBhbiBhcmJpdHJhcnkgcG9zaXRpb24uIFdlIGJlbGlldmUgcmVq
ZWN0LWJ5LWRlZmF1bHQgaXMgdGhlIGNvcnJlY3Qgc2lkZSBvZiB0aGF0IHRyYWRlLCBidXQg
ZmxhZyBpdCBmb3IgZGlzY3Vzc2lvbjsgYSBwZXItc2lnbmFsLWRlcHRoIHRva2VuIHN0YWNr
IHdvdWxkIGFsc28gY2xvc2UgdGhlIGF0dGFjayBhbmQgYXZvaWQgdGhlIHF1ZXN0aW9uIGF0
IGhpZ2hlciBib29ra2VlcGluZyBjb3N0Lg0KDQpSZXByb2R1Y2VyIChwcm9iZSwgc2NyaXB0
cywgcGlubmVkIGtlcm5lbC1pbWFnZSBoYXNoZXMsIGxvZ3MpIGF2YWlsYWJsZSBvbiByZXF1
ZXN0IG9yIHZpYSBhIGJyYW5jaC4NCg0KVGhhbmtzLA0KTG9va2luZyBmb3J3YXJkIHRvIHlv
dXIgcmVwbHkh


